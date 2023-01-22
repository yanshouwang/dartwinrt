// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../winrt_get_property.dart';
import '../winrt_method.dart';
import '../winrt_parameter.dart';
import '../winrt_set_property.dart';

class WinRTDateTimeMethodProjection extends WinRTMethodProjection {
  WinRTDateTimeMethodProjection(super.method, super.vtableOffset);

  // In WinRT, DateTime is represented as a 64-bit signed integer that
  // represents a point in time as the number of 100-nanosecond intervals prior
  // to or after midnight on January 1, 1601 (according to the Gregorian
  // Calendar).
  @override
  String toString() => '''
      DateTime $camelCasedName($methodParams) {
        final retValuePtr = calloc<Uint64>();
        $parametersPreamble

        try {
          ${ffiCall()}

          return DateTime
            .utc(1601, 01, 01)
            .add(Duration(microseconds: retValuePtr.value ~/ 10));
        } finally {
          $parametersPostamble
          free(retValuePtr);
        }
      }
''';
}

class WinRTDateTimeGetterProjection extends WinRTGetPropertyProjection {
  WinRTDateTimeGetterProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      DateTime get $exposedMethodName {
        final retValuePtr = calloc<Uint64>();

        try {
          ${ffiCall()}

          return DateTime
            .utc(1601, 01, 01)
            .add(Duration(microseconds: retValuePtr.value ~/ 10));
        } finally {
          free(retValuePtr);
        }
      }
''';
}

class WinRTDateTimeSetterProjection extends WinRTSetPropertyProjection {
  WinRTDateTimeSetterProjection(super.method, super.vtableOffset);

  @override
  String toString() => '''
      set $exposedMethodName(DateTime value) {
        final dateTimeOffset =
          value.difference(DateTime.utc(1601, 01, 01)).inMicroseconds * 10;

        ${ffiCall(params: 'dateTimeOffset')}
      }
''';
}

class WinRTDateTimeParameterProjection extends WinRTParameterProjection {
  WinRTDateTimeParameterProjection(super.method, super.name, super.type);

  @override
  String get preamble => '''
      final ${name}DateTime =
          $name.difference(DateTime.utc(1601, 01, 01)).inMicroseconds * 10;''';

  @override
  String get postamble => '';

  @override
  String get localIdentifier => '${name}DateTime';
}
