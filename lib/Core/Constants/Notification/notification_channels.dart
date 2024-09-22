import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:local_notification_flutter/Core/Constants/Notification/notification_channel_keys.dart';
import 'package:local_notification_flutter/Core/Constants/Notification/notification_constants.dart';

class Channels {
  static NotificationChannel basicChannel = NotificationChannel(
    channelKey: ChannelKeys.basicChannel,
    channelName: NotificationConstants.basicChannelName,
    channelDescription: ChannelKeys.basicChannelGroup,
    playSound: true,
    importance: NotificationImportance.Max,
    criticalAlerts: true,
    enableVibration: true,
  );
  static NotificationChannel profileChannel = NotificationChannel(
    channelKey: ChannelKeys.profileChannel,
    channelName: NotificationConstants.profileChannelName,
    channelDescription: ChannelKeys.profileChannel,
    playSound: true,
    importance: NotificationImportance.Max,
    criticalAlerts: true,
    enableVibration: true,
    defaultColor: Colors.yellow,
    ledColor: Colors.purple,
  );
  static NotificationChannelGroup basicChannelGroup = NotificationChannelGroup(
    channelGroupKey: ChannelKeys.basicChannelGroup,
    channelGroupName: NotificationConstants.basicChannelGroupName,
  );
}
