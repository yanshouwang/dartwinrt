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
const IID_ILearningModelSessionOptions =
    '{b8f63fa1-134d-5133-8cff-3a5c3c263beb}';

class ILearningModelSessionOptions extends IInspectable {
  ILearningModelSessionOptions.fromPtr(super.ptr)
      : _vtable = ptr.ref.vtable.cast<_ILearningModelSessionOptionsVtbl>().ref;

  final _ILearningModelSessionOptionsVtbl _vtable;

  factory ILearningModelSessionOptions.from(IInspectable interface) =>
      interface.cast(ILearningModelSessionOptions.fromPtr,
          IID_ILearningModelSessionOptions);

  int get batchSizeOverride {
    final value = calloc<Uint32>();

    try {
      final hr = _vtable.get_BatchSizeOverride.asFunction<
          int Function(
              VTablePointer lpVtbl, Pointer<Uint32> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.value;
    } finally {
      free(value);
    }
  }

  set batchSizeOverride(int value) {
    final hr = _vtable.put_BatchSizeOverride
            .asFunction<int Function(VTablePointer lpVtbl, int value)>()(
        lpVtbl, value);

    if (FAILED(hr)) throwWindowsException(hr);
  }
}

final class _ILearningModelSessionOptionsVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<Uint32> value)>>
      get_BatchSizeOverride;
  external Pointer<
          NativeFunction<HRESULT Function(VTablePointer lpVtbl, Uint32 value)>>
      put_BatchSizeOverride;
}
