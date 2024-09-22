import 'dart:async';

abstract class LocalAuthRepository {
  ///register user into shared preference
  FutureOr<void> registerUser();

  ///check the user is already registered or not from shared preference
  bool checkUser();

  /// Delete the user form shared preference
  Future<void> removeUser();
}
