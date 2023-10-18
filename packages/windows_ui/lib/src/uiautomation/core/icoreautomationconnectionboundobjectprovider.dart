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
const IID_ICoreAutomationConnectionBoundObjectProvider =
    '{0620bb64-9616-5593-be3a-eb8e6daeb3fa}';

/// Exposes the properties of a connection-bound object in a remote operation
/// for a UI Automation provider.
class ICoreAutomationConnectionBoundObjectProvider extends IInspectable {
  ICoreAutomationConnectionBoundObjectProvider.fromPtr(super.ptr)
      : _vtable = ptr.ref.vtable
            .cast<_ICoreAutomationConnectionBoundObjectProviderVtbl>()
            .ref;

  final _ICoreAutomationConnectionBoundObjectProviderVtbl _vtable;

  factory ICoreAutomationConnectionBoundObjectProvider.from(
          IInspectable interface) =>
      interface.cast(ICoreAutomationConnectionBoundObjectProvider.fromPtr,
          IID_ICoreAutomationConnectionBoundObjectProvider);

  bool get isComThreadingRequired {
    final value = calloc<Bool>();

    try {
      final hr = _vtable.get_IsComThreadingRequired.asFunction<
          int Function(
              VTablePointer lpVtbl, Pointer<Bool> value)>()(lpVtbl, value);

      if (FAILED(hr)) throwWindowsException(hr);

      return value.value;
    } finally {
      free(value);
    }
  }
}

final class _ICoreAutomationConnectionBoundObjectProviderVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
          NativeFunction<
              HRESULT Function(VTablePointer lpVtbl, Pointer<Bool> value)>>
      get_IsComThreadingRequired;
}
