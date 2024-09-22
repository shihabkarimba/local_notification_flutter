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
  final _notification = GetIt.I<AwesomeNotifications>();
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: 'btn1',
                onPressed: () {
                  _notification.createNotification(
                    content: NotificationContent(
                      displayOnForeground: true,
                      id: 10,
                      criticalAlert: true,
                      channelKey: ChannelKeys.profileChannel,
                      title: 'Go Profile',
                      body: 'This is my first notification!',
                      backgroundColor: Colors.yellow,
                      color: Colors.yellow,
                      displayOnBackground: true,
                    ),
                  );
                },
                child: const Icon(Icons.notifications),
              ),
              FloatingActionButton(
                heroTag: 'btn2',
                onPressed: () {
                  _notification.createNotification(
                    content: NotificationContent(
                      displayOnForeground: true,
                      id: 10,
                      criticalAlert: true,
                      channelKey: ChannelKeys.basicChannel,
                      title: 'Go Notification!',
                      body: 'This is my first notification!',
                    ),
                  );
                },
                child: const Icon(Icons.notification_add),
              ),
            ],
          ),
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
