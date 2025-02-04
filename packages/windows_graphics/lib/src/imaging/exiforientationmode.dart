// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: deprecated_member_use_from_same_package

import 'package:windows_foundation/windows_foundation.dart';

/// Specifies the EXIF orientation flag behavior when obtaining pixel data.
enum ExifOrientationMode implements WinRTEnum {
  ignoreExifOrientation(0),
  respectExifOrientation(1);

  @override
  final int value;

  const ExifOrientationMode(this.value);

  factory ExifOrientationMode.from(int value) =>
      ExifOrientationMode.values.byValue(value);
}
