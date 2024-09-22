import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:local_notification_flutter/Core/Theme/them_data.dart';

import 'Core/Router/route.dart';
import 'Domain/DependencyManager/dependency_manager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setUpDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: themeData,
    );
  }
}
