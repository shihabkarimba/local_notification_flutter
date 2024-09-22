import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:local_notification_flutter/Core/Router/route.dart';
import 'package:local_notification_flutter/Domain/Repository/LocalAuthRepo/local_auth_repo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      redirect();
    });
  }

  redirect() {
    final isLoggedIn = GetIt.I<LocalAuthRepository>().checkUser();
    if (isLoggedIn) {
      router.goNamed(Routes.home.name);
    } else {
      router.goNamed(Routes.login.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
