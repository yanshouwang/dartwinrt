// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart'
    hide DocumentProperties, WinRTStringConversion;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

/// @nodoc
const IID_IAudioEncodingPropertiesWithFormatUserData =
    '{98f10d79-13ea-49ff-be70-2673db69702c}';

class IAudioEncodingPropertiesWithFormatUserData extends IInspectable {
  IAudioEncodingPropertiesWithFormatUserData.fromPtr(super.ptr)
      : _vtable = ptr.ref.vtable
            .cast<_IAudioEncodingPropertiesWithFormatUserDataVtbl>()
            .ref;

  final _IAudioEncodingPropertiesWithFormatUserDataVtbl _vtable;

  factory IAudioEncodingPropertiesWithFormatUserData.from(
          IInspectable interface) =>
      interface.cast(IAudioEncodingPropertiesWithFormatUserData.fromPtr,
          IID_IAudioEncodingPropertiesWithFormatUserData);

  void setFormatUserData(List<int> value) {
    final valueArray = value.toArray<Uint8>();

    final hr = _vtable.SetFormatUserData.asFunction<
        int Function(VTablePointer lpVtbl, int valueSize,
            Pointer<Uint8> value)>()(lpVtbl, value.length, valueArray);

    free(valueArray);

    if (FAILED(hr)) throwWindowsException(hr);
  }

  List<int> getFormatUserData() {
    final valueSize = calloc<Uint32>();
    final value = calloc<Pointer<Uint8>>();

    try {
      final hr = _vtable.GetFormatUserData.asFunction<
          int Function(VTablePointer lpVtbl, Pointer<Uint32> valueSize,
              Pointer<Pointer<Uint8>> value)>()(lpVtbl, valueSize, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.value.toList(length: valueSize.value);
    } finally {
      free(valueSize);
      free(value);
    }
  }
}

final class _IAudioEncodingPropertiesWithFormatUserDataVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
      NativeFunction<
          HRESULT Function(VTablePointer lpVtbl, Uint32 valueSize,
              Pointer<Uint8> value)>> SetFormatUserData;
  external Pointer<
      NativeFunction<
          HRESULT Function(VTablePointer lpVtbl, Pointer<Uint32> valueSize,
              Pointer<Pointer<Uint8>> value)>> GetFormatUserData;
}
