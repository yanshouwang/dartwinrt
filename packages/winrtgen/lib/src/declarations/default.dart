// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../winrt_get_property.dart';
import '../winrt_method.dart';
import '../winrt_set_property.dart';

mixin _DefaultMethodProjection on WinRTMethodProjection {
  String get valRef => returnType.dartType == 'double' ||
          returnType.dartType == 'int' ||
          returnType.dartType == 'bool' ||
          returnType.dartType.startsWith('Pointer')
      ? 'value'
      : 'ref';

  String get freePointer => isStructReturn ? '' : 'free(retValuePtr);';
}

class WinRTDefaultMethodProjection extends WinRTMethodProjection
    with _DefaultMethodProjection {
  WinRTDefaultMethodProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      ${returnType.dartType} $camelCasedName($methodParams) {
        final retValuePtr = calloc<${returnType.nativeType}>();
        $parametersPreamble

        try {
          ${ffiCall()}

          final retValue = retValuePtr.$valRef;
          return retValue;
        } finally {
          $parametersPostamble
          $freePointer
        }
      }
''';
}

class WinRTDefaultGetterProjection extends WinRTGetPropertyProjection
    with _DefaultMethodProjection {
  WinRTDefaultGetterProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      ${returnType.dartType} get $exposedMethodName {
        final retValuePtr = calloc<${returnType.nativeType}>();

        try {
          ${ffiCall()}

          final retValue = retValuePtr.$valRef;
          return retValue;
        } finally {
          $freePointer
        }
      }
''';
}

class WinRTDefaultSetterProjection extends WinRTSetPropertyProjection {
  WinRTDefaultSetterProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      set $exposedMethodName(${parameters.first.type.dartType} value) {
        ${ffiCall(params: 'value')}
      }
  ''';
}
