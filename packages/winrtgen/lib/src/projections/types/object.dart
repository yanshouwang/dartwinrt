// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../getter.dart';
import '../method.dart';
import '../parameter.dart';
import '../setter.dart';
import 'default.dart';

mixin _ObjectProjection on MethodProjection {
  bool get isMethodFromPropertyValueStatics =>
      method.parent.name == 'Windows.Foundation.IPropertyValueStatics';

  @override
  String get returnType {
    // IPropertyValueStatics' methods return 'IInspectable' in WinMD. Normally
    // we expose them as 'Object?' and return the underlying value they carry
    // (e.g. String, bool). However, since these methods are used to box values,
    // we need the 'IPropertyValue' interface to be returned instead of the
    // underlying value (except 'CreateEmpty' and 'CreateInspectable' methods).
    if (isMethodFromPropertyValueStatics) {
      return ['CreateEmpty', 'CreateInspectable'].contains(method.name)
          ? 'Pointer<COMObject>'
          : 'IPropertyValue';
    }

    return 'Object?';
  }

  String get nullCheck => isMethodFromPropertyValueStatics
      ? ''
      : '''
    if (retValuePtr.ref.isNull) {
      free(retValuePtr);
      return null;
    }''';

  String get returnStatement {
    if (isMethodFromPropertyValueStatics) {
      return ['CreateEmpty', 'CreateInspectable'].contains(method.name)
          ? 'return retValuePtr;'
          : 'return IPropertyValue.fromRawPointer(retValuePtr);';
    }

    return 'return IPropertyValue.fromRawPointer(retValuePtr).value;';
  }
}

/// Method projection for methods that return an `Object`.
class ObjectMethodProjection extends MethodProjection with _ObjectProjection {
  ObjectMethodProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  $returnType $camelCasedName($methodParams) {
    final retValuePtr = calloc<COMObject>();
    $parametersPreamble

    ${ffiCall(freeRetValOnFailure: true)}

    $parametersPostamble

    $nullCheck

    $returnStatement
  }
''';
}

/// Getter projection for `Object` getters.
class ObjectGetterProjection extends GetterProjection with _ObjectProjection {
  ObjectGetterProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  $returnType get $camelCasedName {
    final retValuePtr = calloc<COMObject>();

    ${ffiCall(freeRetValOnFailure: true)}

    $nullCheck

    $returnStatement
  }
''';
}

/// Setter projection for `Object` setters.
class ObjectSetterProjection extends SetterProjection with _ObjectProjection {
  ObjectSetterProjection(super.method, super.vtableOffset);

  @override
  String get methodProjection => '''
  set $camelCasedName(${param.type} value) {
    ${ffiCall(params: 'value?.intoBox().ref.lpVtbl ?? nullptr')}
  }
''';
}

/// Parameter projection for `Object` parameters.
class ObjectParameterProjection extends ParameterProjection {
  ObjectParameterProjection(super.parameter);

  @override
  String get type => 'Object?';

  @override
  String get preamble => '';

  @override
  String get postamble => '';

  @override
  String get localIdentifier => '$name?.intoBox().ref.lpVtbl ?? nullptr';
}

/// Parameter projection for `List<Object?>` parameters.
class ObjectListParameterProjection extends DefaultListParameterProjection {
  ObjectListParameterProjection(super.parameter);

  @override
  String get type => 'List<Object?>';

  @override
  String get fillArrayPreamble =>
      'final pArray = calloc<COMObject>(valueSize);';

  @override
  String get passArrayPreamble => '''
    final pArray = calloc<COMObject>(value.length);
    for (var i = 0; i < value.length; i++) {
      pArray[i] = value.elementAt(i)?.intoBox().ref ?? PropertyValue.createEmpty().ref;
    }''';

  @override
  String get receiveArrayPreamble => '''
    final pValueSize = calloc<Uint32>();
    final pArray = calloc<Pointer<COMObject>>();''';

  @override
  String get fillArrayPostamble => '''
    if (retValuePtr.value > 0) {
      value.addAll(pArray.value
          .toList(IPropertyValue.fromRawPointer, length: pValueSize.value)
          .map((e) => e.value));
    }
    free(pArray);''';

  @override
  String get receiveArrayPostamble => '''
    value.addAll(pArray.value
        .toList(IPropertyValue.fromRawPointer, length: pValueSize.value)
        .map((e) => e.value));
    free(pValueSize);
    free(pArray);''';
}
