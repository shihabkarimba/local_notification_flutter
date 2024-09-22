import 'dart:async';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Constants/storage_keys.dart';
import 'local_auth_repo.dart';

class LocalAuthRepositoryImpl implements LocalAuthRepository {
  final _pref = GetIt.I<SharedPreferences>();

  @override
  bool checkUser() {
    try {
      final isUserLoggedIn =
          (_pref.getBool(StorageKeys.isUserLoggedIn)) ?? false;
      return isUserLoggedIn ? true : false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  FutureOr<void> registerUser() async {
    try {
      _pref.setBool(StorageKeys.isUserLoggedIn, true);
    } catch (e) {
      log(e.toString());
      return;
    }
  }

  @override
  Future<void> removeUser() async {
    try {
      _pref.setBool(StorageKeys.isUserLoggedIn, false);
    } catch (e) {
      log(e.toString());
      return;
    }
  }
}
