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

import '../videoframe.dart';
import 'imediacapturestopresult.dart';

/// Provides the last frame captured and the recorded duration of a media
/// capture operation that has been stopped.
class MediaCaptureStopResult extends IInspectable
    implements IMediaCaptureStopResult, IClosable {
  MediaCaptureStopResult.fromPtr(super.ptr);

  late final _iMediaCaptureStopResult = IMediaCaptureStopResult.from(this);

  @override
  VideoFrame? get lastFrame => _iMediaCaptureStopResult.lastFrame;

  @override
  Duration get recordDuration => _iMediaCaptureStopResult.recordDuration;

  late final _iClosable = IClosable.from(this);

  @override
  void close() => _iClosable.close();
}
