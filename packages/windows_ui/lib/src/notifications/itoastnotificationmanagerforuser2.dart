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

import 'toastcollectionmanager.dart';
import 'toastnotificationhistory.dart';
import 'toastnotifier.dart';

/// @nodoc
const IID_IToastNotificationManagerForUser2 =
    '{679c64b7-81ab-42c2-8819-c958767753f4}';

/// {@category interface}
class IToastNotificationManagerForUser2 extends IInspectable {
  // vtable begins at 6, is 4 entries long.
  IToastNotificationManagerForUser2.fromRawPointer(super.ptr);

  factory IToastNotificationManagerForUser2.from(IInspectable interface) =>
      IToastNotificationManagerForUser2.fromRawPointer(
          interface.toInterface(IID_IToastNotificationManagerForUser2));

  Future<ToastNotifier?> getToastNotifierForToastCollectionIdAsync(
      String collectionId) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<ToastNotifier?>();
    final collectionIdHString = convertToHString(collectionId);

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(LPVTBL, IntPtr collectionId,
                            Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(LPVTBL, int collectionId, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, collectionIdHString, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(collectionIdHString);

    final asyncOperation = IAsyncOperation<ToastNotifier?>.fromRawPointer(
        retValuePtr,
        creator: ToastNotifier.fromRawPointer);
    completeAsyncOperation(
        asyncOperation, completer, asyncOperation.getResults);

    return completer.future;
  }

  Future<ToastNotificationHistory?> getHistoryForToastCollectionIdAsync(
      String collectionId) {
    final retValuePtr = calloc<COMObject>();
    final completer = Completer<ToastNotificationHistory?>();
    final collectionIdHString = convertToHString(collectionId);

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(LPVTBL, IntPtr collectionId,
                            Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(LPVTBL, int collectionId, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, collectionIdHString, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(collectionIdHString);

    final asyncOperation =
        IAsyncOperation<ToastNotificationHistory?>.fromRawPointer(retValuePtr,
            creator: ToastNotificationHistory.fromRawPointer);
    completeAsyncOperation(
        asyncOperation, completer, asyncOperation.getResults);

    return completer.future;
  }

  ToastCollectionManager? getToastCollectionManager() {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
        .elementAt(8)
        .cast<
            Pointer<
                NativeFunction<HRESULT Function(LPVTBL, Pointer<COMObject>)>>>()
        .value
        .asFunction<
            int Function(
                LPVTBL, Pointer<COMObject>)>()(ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    if (retValuePtr.ref.isNull) {
      free(retValuePtr);
      return null;
    }

    return ToastCollectionManager.fromRawPointer(retValuePtr);
  }

  ToastCollectionManager? getToastCollectionManagerWithAppId(String appId) {
    final retValuePtr = calloc<COMObject>();
    final appIdHString = convertToHString(appId);

    final hr = ptr.ref.vtable
            .elementAt(9)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            LPVTBL, IntPtr appId, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(LPVTBL, int appId, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, appIdHString, retValuePtr);

    if (FAILED(hr)) {
      free(retValuePtr);
      throw WindowsException(hr);
    }

    WindowsDeleteString(appIdHString);

    if (retValuePtr.ref.isNull) {
      free(retValuePtr);
      return null;
    }

    return ToastCollectionManager.fromRawPointer(retValuePtr);
  }
}
