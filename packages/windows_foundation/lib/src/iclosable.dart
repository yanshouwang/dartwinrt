// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

import '../../../internal.dart';
import 'callbacks.dart';
import 'helpers.dart';

/// @nodoc
const IID_IClosable = '{30d5a829-7fa4-4026-83bb-d75bae4ea99e}';

/// Defines a method to release allocated resources.
///
/// {@category interface}
class IClosable extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IClosable.fromRawPointer(super.ptr);

  factory IClosable.from(IInspectable interface) =>
      IClosable.fromRawPointer(interface.toInterface(IID_IClosable));

  void close() {
    final hr = ptr.ref.vtable
        .elementAt(6)
        .cast<Pointer<NativeFunction<HRESULT Function(Pointer)>>>()
        .value
        .asFunction<int Function(Pointer)>()(ptr.ref.lpVtbl);

    if (FAILED(hr)) throw WindowsException(hr);
  }
}
