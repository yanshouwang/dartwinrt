// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: deprecated_member_use_from_same_package

import 'package:windows_foundation/windows_foundation.dart';

/// Describes the purpose of the thumbnail to determine how to adjust the
/// thumbnail image to retrieve.
enum ThumbnailMode implements WinRTEnum {
  picturesView(0),
  videosView(1),
  musicView(2),
  documentsView(3),
  listView(4),
  singleItem(5);

  @override
  final int value;

  const ThumbnailMode(this.value);

  factory ThumbnailMode.from(int value) =>
      ThumbnailMode.values.firstWhere((e) => e.value == value,
          orElse: () => throw ArgumentError.value(
              value, 'value', 'No enum value with that value'));
}
