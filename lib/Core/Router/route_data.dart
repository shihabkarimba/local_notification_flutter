part of 'route.dart';

class RouteInfo {
  final String name;
  final String path;
  final GoRouterPageBuilder? pageBuilder;

  const RouteInfo({
    required this.name,
    required this.path,
    required this.pageBuilder,
  });

  const RouteInfo.shell({
    required this.name,
    required this.path,
    required this.pageBuilder,
  });
}

class Routes {
  static final splash = RouteInfo(
    name: 'splash',
    path: '/splash',
    pageBuilder: (context, state) {
      return const MaterialPage(child: SplashPage());
    },
  );

  static final login = RouteInfo(
    name: 'login',
    path: '/login',
    pageBuilder: (context, state) {
      return const MaterialPage(child: LoginPage());
    },
  );

  static final signup = RouteInfo(
    name: 'signup',
    path: 'signup',
    pageBuilder: (context, state) {
      return const MaterialPage(child: SignupPage());
    },
  );

  static final home = RouteInfo(
    name: 'home',
    path: '/home',
    pageBuilder: (context, state) {
      return const MaterialPage(child: HomePage());
    },
  );

  static final profile = RouteInfo(
    name: 'profile',
    path: '/profile',
    pageBuilder: (context, state) {
      return const MaterialPage(child: ProfilePage());
    },
  );
}
