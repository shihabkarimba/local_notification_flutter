import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notification_flutter/Core/Constants/usages.dart';

import '../../../../Bloc/Login/login_bloc.dart';
import '../View/login_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Usages.login),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginView(),
      ),
    );
  }
}
