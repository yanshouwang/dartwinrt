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

import 'advancedphotocapturesettings.dart';
import 'advancedphotomode.dart';

/// @nodoc
const IID_IAdvancedPhotoControl = '{c5b15486-9001-4682-9309-68eae0080eec}';

class IAdvancedPhotoControl extends IInspectable {
  IAdvancedPhotoControl.fromPtr(super.ptr)
      : _vtable = ptr.ref.vtable.cast<_IAdvancedPhotoControlVtbl>().ref;

  final _IAdvancedPhotoControlVtbl _vtable;

  factory IAdvancedPhotoControl.from(IInspectable interface) =>
      interface.cast(IAdvancedPhotoControl.fromPtr, IID_IAdvancedPhotoControl);

  bool get supported {
    final value = calloc<Bool>();

    try {
      final hr = _vtable.get_Supported.asFunction<
          int Function(
              VTablePointer lpVtbl, Pointer<Bool> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.value;
    } finally {
      free(value);
    }
  }

  List<AdvancedPhotoMode>? get supportedModes {
    final value = calloc<COMObject>();

    final hr = _vtable.get_SupportedModes.asFunction<
        int Function(
            VTablePointer lpVtbl, Pointer<COMObject> value)>()(lpVtbl, value);

    if (FAILED(hr)) {
      free(value);
      throwWindowsException(hr);
    }

    if (value.isNull) {
      free(value);
      return null;
    }

    return IVectorView<AdvancedPhotoMode>.fromPtr(value,
            iterableIid: '{7d090784-70a9-570c-be82-0d0890318975}',
            enumCreator: AdvancedPhotoMode.from)
        .toList();
  }

  AdvancedPhotoMode get mode {
    final value = calloc<Int32>();

    try {
      final hr = _vtable.get_Mode.asFunction<
          int Function(
              VTablePointer lpVtbl, Pointer<Int32> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return AdvancedPhotoMode.from(value.value);
    } finally {
      free(value);
    }
  }

  void configure(AdvancedPhotoCaptureSettings? settings) {
    final hr = _vtable.Configure.asFunction<
            int Function(VTablePointer lpVtbl, VTablePointer settings)>()(
        lpVtbl, settings.lpVtbl);

    if (FAILED(hr)) throwWindowsException(hr);
  }
}

final class _IAdvancedPhotoControlVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<Bool> value)>>
      get_Supported;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<COMObject> value)>>
      get_SupportedModes;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<Int32> value)>>
      get_Mode;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, VTablePointer settings)>>
      Configure;
}
