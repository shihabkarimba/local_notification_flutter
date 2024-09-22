import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:local_notification_flutter/Core/Constants/Notification/notification_channels.dart';

Future<void> setupNotification() async {
  await AwesomeNotifications().initialize(
    null,
    [Channels.basicChannel],
    channelGroups: [Channels.basicChannelGroup],
  );
  final isNotificationAllowed =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isNotificationAllowed) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
}
