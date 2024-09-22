import 'dart:async';

import 'package:local_notification_flutter/Models/ErrorResponse/error_response.dart';
import 'package:local_notification_flutter/Models/UserModel/user_model.dart';

abstract class FirebaseAuthRepository {
  ///sign up user with email and password
  Future<(bool, ErrorResponse?)> signUpUser({
    required String email,
    required String password,
    required String name,
  });

  ///login user with email and password
  Future<(bool, ErrorResponse?)> loginUser({
    required String email,
    required String password,
  });

  Future<UserModel?> getUserProfile();
}
