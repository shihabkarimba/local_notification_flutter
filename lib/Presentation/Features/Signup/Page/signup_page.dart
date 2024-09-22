import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notification_flutter/Bloc/Signup/signup_bloc.dart';
import 'package:local_notification_flutter/Core/Constants/Usages/usages.dart';

import '../View/signup_view.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Usages.signup),
      ),
      body: BlocProvider(
        create: (context) => SignupBloc(),
        child: const SignupView(),
      ),
    );
  }
}
