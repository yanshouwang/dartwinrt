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
import 'package:windows_data/windows_data.dart';
import 'package:windows_foundation/internal.dart';
import 'package:windows_foundation/windows_foundation.dart';

import 'enums.g.dart';
import 'ischeduledtoastnotification.dart';
import 'ischeduledtoastnotification2.dart';
import 'ischeduledtoastnotification3.dart';
import 'ischeduledtoastnotification4.dart';
import 'ischeduledtoastnotificationfactory.dart';

/// Contains the XML that defines the toast notification that will display
/// at the scheduled time.
///
/// {@category class}
class ScheduledToastNotification extends IInspectable
    implements
        IScheduledToastNotification,
        IScheduledToastNotification2,
        IScheduledToastNotification3,
        IScheduledToastNotification4 {
  ScheduledToastNotification.fromRawPointer(super.ptr);

  static const _className =
      'Windows.UI.Notifications.ScheduledToastNotification';

  // IScheduledToastNotificationFactory methods
  factory ScheduledToastNotification.createScheduledToastNotification(
      XmlDocument content, DateTime deliveryTime) {
    final activationFactoryPtr = createActivationFactory(
        _className, IID_IScheduledToastNotificationFactory);
    final object =
        IScheduledToastNotificationFactory.fromRawPointer(activationFactoryPtr);

    try {
      return object.createScheduledToastNotification(content, deliveryTime);
    } finally {
      object.release();
    }
  }

  factory ScheduledToastNotification.createScheduledToastNotificationRecurring(
      XmlDocument content,
      DateTime deliveryTime,
      Duration snoozeInterval,
      int maximumSnoozeCount) {
    final activationFactoryPtr = createActivationFactory(
        _className, IID_IScheduledToastNotificationFactory);
    final object =
        IScheduledToastNotificationFactory.fromRawPointer(activationFactoryPtr);

    try {
      return object.createScheduledToastNotificationRecurring(
          content, deliveryTime, snoozeInterval, maximumSnoozeCount);
    } finally {
      object.release();
    }
  }

  // IScheduledToastNotification methods
  late final _iScheduledToastNotification =
      IScheduledToastNotification.from(this);

  @override
  XmlDocument? get content => _iScheduledToastNotification.content;

  @override
  DateTime get deliveryTime => _iScheduledToastNotification.deliveryTime;

  @override
  Duration? get snoozeInterval => _iScheduledToastNotification.snoozeInterval;

  @override
  int get maximumSnoozeCount => _iScheduledToastNotification.maximumSnoozeCount;

  @override
  set id(String value) => _iScheduledToastNotification.id = value;

  @override
  String get id => _iScheduledToastNotification.id;

  // IScheduledToastNotification2 methods
  late final _iScheduledToastNotification2 =
      IScheduledToastNotification2.from(this);

  @override
  set tag(String value) => _iScheduledToastNotification2.tag = value;

  @override
  String get tag => _iScheduledToastNotification2.tag;

  @override
  set group(String value) => _iScheduledToastNotification2.group = value;

  @override
  String get group => _iScheduledToastNotification2.group;

  @override
  set suppressPopup(bool value) =>
      _iScheduledToastNotification2.suppressPopup = value;

  @override
  bool get suppressPopup => _iScheduledToastNotification2.suppressPopup;

  // IScheduledToastNotification3 methods
  late final _iScheduledToastNotification3 =
      IScheduledToastNotification3.from(this);

  @override
  NotificationMirroring get notificationMirroring =>
      _iScheduledToastNotification3.notificationMirroring;

  @override
  set notificationMirroring(NotificationMirroring value) =>
      _iScheduledToastNotification3.notificationMirroring = value;

  @override
  String get remoteId => _iScheduledToastNotification3.remoteId;

  @override
  set remoteId(String value) => _iScheduledToastNotification3.remoteId = value;

  // IScheduledToastNotification4 methods
  late final _iScheduledToastNotification4 =
      IScheduledToastNotification4.from(this);

  @override
  DateTime? get expirationTime => _iScheduledToastNotification4.expirationTime;

  @override
  set expirationTime(DateTime? value) =>
      _iScheduledToastNotification4.expirationTime = value;
}
