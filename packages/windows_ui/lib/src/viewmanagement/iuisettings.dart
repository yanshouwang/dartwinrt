// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart' hide DocumentProperties;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import '../structs.g.dart';
import 'enums.g.dart';

/// @nodoc
const IID_IUISettings = '{85361600-1c63-4627-bcb1-3a89e0bc9c55}';

/// {@category interface}
class IUISettings extends IInspectable {
  // vtable begins at 6, is 13 entries long.
  IUISettings.fromRawPointer(super.ptr);

  factory IUISettings.from(IInspectable interface) =>
      IUISettings.fromRawPointer(interface.toInterface(IID_IUISettings));

  HandPreference get handPreference {
    final retValuePtr = calloc<Int32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(6)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Int32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Int32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return HandPreference.from(retValuePtr.value);
    } finally {
      free(retValuePtr);
    }
  }

  Size get cursorSize {
    final retValuePtr = calloc<Size>();

    final hr = ptr.ref.vtable
        .elementAt(7)
        .cast<
            Pointer<NativeFunction<HRESULT Function(LPVTBL, Pointer<Size>)>>>()
        .value
        .asFunction<
            int Function(LPVTBL, Pointer<Size>)>()(ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr.ref;
  }

  Size get scrollBarSize {
    final retValuePtr = calloc<Size>();

    final hr = ptr.ref.vtable
        .elementAt(8)
        .cast<
            Pointer<NativeFunction<HRESULT Function(LPVTBL, Pointer<Size>)>>>()
        .value
        .asFunction<
            int Function(LPVTBL, Pointer<Size>)>()(ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr.ref;
  }

  Size get scrollBarArrowSize {
    final retValuePtr = calloc<Size>();

    final hr = ptr.ref.vtable
        .elementAt(9)
        .cast<
            Pointer<NativeFunction<HRESULT Function(LPVTBL, Pointer<Size>)>>>()
        .value
        .asFunction<
            int Function(LPVTBL, Pointer<Size>)>()(ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr.ref;
  }

  Size get scrollBarThumbBoxSize {
    final retValuePtr = calloc<Size>();

    final hr = ptr.ref.vtable
        .elementAt(10)
        .cast<
            Pointer<NativeFunction<HRESULT Function(LPVTBL, Pointer<Size>)>>>()
        .value
        .asFunction<
            int Function(LPVTBL, Pointer<Size>)>()(ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr.ref;
  }

  int get messageDuration {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(11)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Uint32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Uint32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  bool get animationsEnabled {
    final retValuePtr = calloc<Bool>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(12)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Bool>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Bool>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  bool get caretBrowsingEnabled {
    final retValuePtr = calloc<Bool>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(13)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Bool>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Bool>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  int get caretBlinkRate {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(14)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Uint32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Uint32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  int get caretWidth {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(15)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Uint32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Uint32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  int get doubleClickTime {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(16)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Uint32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Uint32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  int get mouseHoverTime {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(17)
          .cast<
              Pointer<
                  NativeFunction<HRESULT Function(LPVTBL, Pointer<Uint32>)>>>()
          .value
          .asFunction<
              int Function(
                  LPVTBL, Pointer<Uint32>)>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  Color uiElementColor(UIElementType desiredElement) {
    final retValuePtr = calloc<Color>();

    final hr = ptr.ref.vtable
            .elementAt(18)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            LPVTBL, Int32 desiredElement, Pointer<Color>)>>>()
            .value
            .asFunction<
                int Function(LPVTBL, int desiredElement, Pointer<Color>)>()(
        ptr.ref.lpVtbl, desiredElement.value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr.ref;
  }
}
