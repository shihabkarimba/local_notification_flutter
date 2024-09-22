import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notification_flutter/Bloc/Signup/signup_bloc.dart';
import 'package:local_notification_flutter/Core/Constants/Validator/validator.dart';
import 'package:local_notification_flutter/Core/Router/route.dart';
import 'package:local_notification_flutter/Presentation/Shared/Widgets/toast_widget.dart';

import '../../../../Core/Constants/Usages/usages.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (ctx, state) {
        switch (state) {
          case SignupErrorState(message: final message):
            showToast(msg: message, toastType: ToastType.error);
          case SignupLoadedState():
            router.goNamed(Routes.home.name);
          case SignupInitialState():
          case SignupLoadingState():
        }
      },
      builder: (ctx, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.emailAddress,
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return Usages.nameValidateErrorMessage;
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: Usages.name,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (!Validator.isValidEmail(email)) {
                          return Usages.emailErrorMessage;
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: Usages.email,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _password,
                      validator: (val) {
                        if (val == null || val.isEmpty || val.length < 4) {
                          return Usages.passwordErrorMessage;
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: Usages.password,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (_password.text != val) {
                          return Usages.confirmPasswordErrorMessage;
                        }
                        return null;
                      },
                      controller: _confirmPassword,
                      decoration: const InputDecoration(
                        labelText: Usages.confirmPassword,
                      ),
                    ),
                    const SizedBox(height: 25),
                    switch (state) {
                      SignupLoadingState() =>
                        const Center(child: CircularProgressIndicator()),
                      SignupInitialState() ||
                      SignupLoadedState() ||
                      SignupErrorState() =>
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ctx.read<SignupBloc>().add(
                                    OnSignupButtonPressedEvent(
                                      email: _email.text.trim(),
                                      password: _password.text.trim(),
                                      name: _name.text.trim(),
                                    ),
                                  );
                            }
                          },
                          child: const Text(Usages.signup),
                        ),
                    },
                    const SizedBox(height: 25),
                    if (state != SignupLoadingState())
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(Usages.alreadyHaveAccount),
                          TextButton(
                            onPressed: () {
                              router.pop();
                            },
                            child: const Text(Usages.login),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
