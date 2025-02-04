// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart' hide WinRTStringConversion;
import 'package:windows_data/windows_data.dart';
import 'package:windows_devices/windows_devices.dart';
import 'package:windows_graphics/windows_graphics.dart';
import 'package:windows_media/windows_media.dart';
import 'package:windows_networking/windows_networking.dart';
import 'package:windows_services/windows_services.dart';
import 'package:windows_storage/windows_storage.dart';
import 'package:windows_ui/windows_ui.dart';

import '../../internal.dart';
import '../point.dart';
import '../rect.dart';
import '../size.dart';
import '../types.dart';

part 'iiterator_part.dart';

/// Supports simple iteration over a collection.
abstract interface class IIterator<T> extends IInspectable {
  IIterator(super.ptr);

  /// Creates an instance of [IIterator] from the given [ptr].
  ///
  /// [T] must be of type `bool`, `DateTime`, `double`, `Duration`, `Guid`,
  /// `int`, `Object?`, `String`, `Uri?`, `IInspectable?` (e.g.,
  /// `StorageFile?`), `WinRTEnum` (e.g., `DeviceClass`), or `WinRTStruct`
  /// (e.g., `BasicGeoposition`).
  ///
  /// [doubleType] must be specified if [T] is `double`.
  /// ```dart
  /// final iterator =
  ///     IIterator<double>.fromPtr(ptr, doubleType: DoubleType.float);
  /// ```
  ///
  /// [intType] must be specified if [T] is `int`.
  /// ```dart
  /// final iterator = IIterator<int>.fromPtr(ptr, intType: IntType.uint64);
  /// ```
  ///
  /// [creator] must be specified if [T] is `IInspectable?`.
  /// ```dart
  /// final iterator = IIterator<StorageFile?>.fromPtr(ptr,
  ///     creator: StorageFile.fromPtr);
  /// ```
  ///
  /// [enumCreator] must be specified if [T] is `WinRTEnum`.
  /// ```dart
  /// final iterator = IIterator<DeviceClass>.fromPtr(ptr,
  ///     enumCreator: DeviceClass.from);
  /// ```
  factory IIterator.fromPtr(
    Pointer<COMObject> ptr, {
    COMObjectCreator<T>? creator,
    EnumCreator<T>? enumCreator,
    DoubleType? doubleType,
    IntType? intType,
  }) {
    if (T == bool) return _IIteratorBool.fromPtr(ptr) as IIterator<T>;
    if (T == DateTime) return _IIteratorDateTime.fromPtr(ptr) as IIterator<T>;
    if (T == Duration) return _IIteratorDuration.fromPtr(ptr) as IIterator<T>;
    if (T == Guid) return _IIteratorGuid.fromPtr(ptr) as IIterator<T>;

    if (T == double) {
      if (doubleType == null) throw ArgumentError.notNull('doubleType');
      final iterator = switch (doubleType) {
        DoubleType.double => _IIteratorDouble.fromPtr(ptr),
        DoubleType.float => _IIteratorFloat.fromPtr(ptr),
      };
      return iterator as IIterator<T>;
    }

    if (T == int) {
      if (intType == null) throw ArgumentError.notNull('intType');
      final iterator = switch (intType) {
        IntType.int16 => _IIteratorInt16.fromPtr(ptr),
        IntType.int32 => _IIteratorInt32.fromPtr(ptr),
        IntType.int64 => _IIteratorInt64.fromPtr(ptr),
        IntType.uint8 => _IIteratorUint8.fromPtr(ptr),
        IntType.uint16 => _IIteratorUint16.fromPtr(ptr),
        IntType.uint32 => _IIteratorUint32.fromPtr(ptr),
        IntType.uint64 => _IIteratorUint64.fromPtr(ptr)
      };
      return iterator as IIterator<T>;
    }

    if (isSubtypeOfInspectable<T>()) {
      if (creator == null) throw ArgumentError.notNull('creator');
      return _IIteratorInspectable.fromPtr(ptr, creator: creator);
    }

    if (T == String) return _IIteratorString.fromPtr(ptr) as IIterator<T>;
    if (isSubtype<T, Uri>()) return _IIteratorUri.fromPtr(ptr) as IIterator<T>;

    if (isSubtypeOfWinRTFlagsEnum<T>()) {
      if (enumCreator == null) throw ArgumentError.notNull('enumCreator');
      return _IIteratorWinRTFlagsEnum.fromPtr(ptr, enumCreator: enumCreator);
    }

    if (isSubtypeOfWinRTEnum<T>()) {
      if (enumCreator == null) throw ArgumentError.notNull('enumCreator');
      return _IIteratorWinRTEnum.fromPtr(ptr, enumCreator: enumCreator);
    }

    if (isNullableObjectType<T>()) {
      return _IIteratorObject.fromPtr(ptr) as IIterator<T>;
    }

    if (isSubtypeOfWinRTStruct<T>()) {
      if (T == AccessListEntry) {
        return _IIteratorAccessListEntry.fromPtr(ptr) as IIterator<T>;
      }
      if (T == BackgroundTransferFileRange) {
        return _IIteratorBackgroundTransferFileRange.fromPtr(ptr)
            as IIterator<T>;
      }
      if (T == BasicGeoposition) {
        return _IIteratorBasicGeoposition.fromPtr(ptr) as IIterator<T>;
      }
      if (T == Color) return _IIteratorColor.fromPtr(ptr) as IIterator<T>;
      if (T == GpioChangeRecord) {
        return _IIteratorGpioChangeRecord.fromPtr(ptr) as IIterator<T>;
      }
      if (T == MediaTimeRange) {
        return _IIteratorMediaTimeRange.fromPtr(ptr) as IIterator<T>;
      }
      if (T == MseTimeRange) {
        return _IIteratorMseTimeRange.fromPtr(ptr) as IIterator<T>;
      }
      if (T == NitRange) return _IIteratorNitRange.fromPtr(ptr) as IIterator<T>;
      if (T == Point) return _IIteratorPoint.fromPtr(ptr) as IIterator<T>;
      if (T == PointerDeviceUsage) {
        return _IIteratorPointerDeviceUsage.fromPtr(ptr) as IIterator<T>;
      }
      if (T == Rect) return _IIteratorRect.fromPtr(ptr) as IIterator<T>;
      if (T == RectInt32)
        return _IIteratorRectInt32.fromPtr(ptr) as IIterator<T>;
      if (T == Size) return _IIteratorSize.fromPtr(ptr) as IIterator<T>;
      if (T == SizeUInt32) {
        return _IIteratorSizeUInt32.fromPtr(ptr) as IIterator<T>;
      }
      if (T == SortEntry)
        return _IIteratorSortEntry.fromPtr(ptr) as IIterator<T>;
      if (T == StorePackageUpdateStatus) {
        return _IIteratorStorePackageUpdateStatus.fromPtr(ptr) as IIterator<T>;
      }
      if (T == TextRange) {
        return _IIteratorTextRange.fromPtr(ptr) as IIterator<T>;
      }
      if (T == TextSegment) {
        return _IIteratorTextSegment.fromPtr(ptr) as IIterator<T>;
      }
      if (T == WindowId) return _IIteratorWindowId.fromPtr(ptr) as IIterator<T>;
    }

    throw UnsupportedError('Unsupported type argument: $T');
  }

  late final _IIteratorVtbl __vtable =
      ptr.ref.vtable.cast<_IIteratorVtbl>().ref;

  /// Gets the current item in the collection.
  T get current;

  /// Gets a value that indicates whether the iterator refers to a current item
  /// or is at the end of the collection.
  bool get hasCurrent {
    final retValuePtr = calloc<Bool>();

    try {
      final hr = __vtable.get_HasCurrent.asFunction<
              int Function(VTablePointer lpVtbl, Pointer<Bool> retValuePtr)>()(
          lpVtbl, retValuePtr);

      if (FAILED(hr)) throwWindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  /// Advances the iterator to the next item in the collection.
  bool moveNext() {
    final retValuePtr = calloc<Bool>();

    try {
      final hr = __vtable.MoveNext.asFunction<
              int Function(VTablePointer lpVtbl, Pointer<Bool> retValuePtr)>()(
          lpVtbl, retValuePtr);

      if (FAILED(hr)) throwWindowsException(hr);

      return retValuePtr.value;
    } finally {
      free(retValuePtr);
    }
  }

  /// Retrieves multiple items from the iterator.
  (int, {List<T> items}) getMany(int capacity);
}

final class _IIteratorVtbl extends Struct {
  external IInspectableVtbl baseVtbl;
  external Pointer<
      NativeFunction<
          HRESULT Function(
              VTablePointer lpVtbl /* ,
              Pointer<T> retValuePtr */
              )>> get_Current;
  external Pointer<
      NativeFunction<
          HRESULT Function(
              VTablePointer lpVtbl, Pointer<Bool> retValuePtr)>> get_HasCurrent;
  external Pointer<
      NativeFunction<
          HRESULT Function(
              VTablePointer lpVtbl, Pointer<Bool> retValuePtr)>> MoveNext;
  external Pointer<
      NativeFunction<
          HRESULT Function(
              VTablePointer lpVtbl,
              Uint32 itemsSize,
              /*    Pointer<T> items, */
              Pointer<Uint32> retValuePtr)>> GetMany;
}
