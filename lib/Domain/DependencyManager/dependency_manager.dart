import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:local_notification_flutter/Domain/DependencyManager/Notification/setup_notification.dart';
import 'package:local_notification_flutter/Domain/Repository/FirebaseAuthRepo/firebase_auth_repo.dart';
import 'package:local_notification_flutter/Domain/Repository/LocalAuthRepo/local_auth_repo.dart';
import 'package:local_notification_flutter/Domain/Repository/LocalAuthRepo/local_auth_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Repository/FirebaseAuthRepo/firebase_auth_repo_impl.dart';

final GetIt getIt = GetIt.instance;

setUpDependencies() async {
  await setupNotification();
  await getUtils();
  await getRepositories();
}

getUtils() async {
  GetIt.I.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  GetIt.I.registerLazySingleton<AwesomeNotifications>(
      () => AwesomeNotifications());

  ///
  GetIt.I.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await GetIt.instance.isReady<SharedPreferences>();
}

getRepositories() async {
  GetIt.I.registerLazySingleton<LocalAuthRepository>(
      () => LocalAuthRepositoryImpl());
  GetIt.I.registerLazySingleton<FirebaseAuthRepository>(
      () => FirebaseAuthRepositoryImpl());
}
