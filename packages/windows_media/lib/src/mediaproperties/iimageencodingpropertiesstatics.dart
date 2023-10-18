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

import 'imageencodingproperties.dart';

/// @nodoc
const IID_IImageEncodingPropertiesStatics =
    '{257c68dc-8b99-439e-aa59-913a36161297}';

class IImageEncodingPropertiesStatics extends IInspectable {
  IImageEncodingPropertiesStatics.fromPtr(super.ptr)
      : _vtable =
            ptr.ref.vtable.cast<_IImageEncodingPropertiesStaticsVtbl>().ref;

  final _IImageEncodingPropertiesStaticsVtbl _vtable;

  factory IImageEncodingPropertiesStatics.from(IInspectable interface) =>
      interface.cast(IImageEncodingPropertiesStatics.fromPtr,
          IID_IImageEncodingPropertiesStatics);

  ImageEncodingProperties? createJpeg() {
    final value = calloc<COMObject>();

    final hr = _vtable.CreateJpeg.asFunction<
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

    return ImageEncodingProperties.fromPtr(value);
  }

  ImageEncodingProperties? createPng() {
    final value = calloc<COMObject>();

    final hr = _vtable.CreatePng.asFunction<
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

    return ImageEncodingProperties.fromPtr(value);
  }

  ImageEncodingProperties? createJpegXR() {
    final value = calloc<COMObject>();

    final hr = _vtable.CreateJpegXR.asFunction<
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

    return ImageEncodingProperties.fromPtr(value);
  }
}

final class _IImageEncodingPropertiesStaticsVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<COMObject> value)>>
      CreateJpeg;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<COMObject> value)>>
      CreatePng;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<COMObject> value)>>
      CreateJpegXR;
}
