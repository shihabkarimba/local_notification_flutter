import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:local_notification_flutter/Bloc/UserProfile/user_profile_bloc.dart';
import 'package:local_notification_flutter/Core/Constants/Notification/notification_channel_keys.dart';

class ScaffoldWIthBottomNavBar extends StatefulWidget {
  final StatefulNavigationShell shell;

  const ScaffoldWIthBottomNavBar({super.key, required this.shell});

  @override
  State<ScaffoldWIthBottomNavBar> createState() =>
      _ScaffoldWIthBottomNavBarState();
}

class _ScaffoldWIthBottomNavBarState extends State<ScaffoldWIthBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfileBloc>(
          create: (BuildContext context) => UserProfileBloc(),
        ),
      ],
      child: Scaffold(
        body: widget.shell,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final notification = GetIt.I<AwesomeNotifications>();
            notification.createNotification(
              content: NotificationContent(
                displayOnForeground: true,
                id: 10,
                criticalAlert: true,
                channelKey: ChannelKeys.basicChannel,
                actionType: ActionType.Default,
                title: 'Hello World!',
                body: 'This is my first notification!',
              ),
            );
          },
          child: const Icon(Icons.notification_add),
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: widget.shell.goBranch,
          selectedIndex: widget.shell.currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'settings',
            ),
          ],
        ),
      ),
    );
  }
}
