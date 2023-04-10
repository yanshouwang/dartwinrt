// Copyright (c) 2023, the dartwinrt authors. Please see the AUTHORS file for
// details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: unnecessary_import, unused_import

import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart' hide DocumentProperties;
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'geopoint.dart';

/// @nodoc
const IID_IGeocoordinateWithPoint = '{feea0525-d22c-4d46-b527-0b96066fc7db}';

/// {@category interface}
class IGeocoordinateWithPoint extends IInspectable {
  // vtable begins at 6, is 1 entries long.
  IGeocoordinateWithPoint.fromPtr(super.ptr);

  factory IGeocoordinateWithPoint.from(IInspectable interface) =>
      IGeocoordinateWithPoint.fromPtr(
          interface.toInterface(IID_IGeocoordinateWithPoint));

  Geopoint? get point {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
        .elementAt(6)
        .cast<
            Pointer<
                NativeFunction<
                    HRESULT Function(VTablePointer lpVtbl,
                        Pointer<COMObject> retValuePtr)>>>()
        .value
        .asFunction<
            int Function(VTablePointer lpVtbl,
                Pointer<COMObject> retValuePtr)>()(ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    if (retValuePtr.ref.isNull) {
      free(retValuePtr);
      return null;
    }

    return Geopoint.fromPtr(retValuePtr);
  }
}
