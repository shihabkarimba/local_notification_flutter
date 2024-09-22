import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:local_notification_flutter/Core/Constants/Notification/notification_channel_keys.dart';
import 'package:local_notification_flutter/Core/Constants/Notification/notification_constants.dart';

class Channels {
  static NotificationChannel basicChannel = NotificationChannel(
    channelKey: ChannelKeys.basicChannel,
    channelName: NotificationConstants.basicChannelName,
    channelDescription: ChannelKeys.basicChannelGroup,
  );
  static NotificationChannelGroup basicChannelGroup = NotificationChannelGroup(
    channelGroupKey: ChannelKeys.basicChannelGroup,
    channelGroupName: NotificationConstants.basicChannelGroupName,
  );
}
