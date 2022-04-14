import 'package:flutter/material.dart';
import 'package:ohio_templates/feature/home/presentation/home_page.dart';
import 'package:ohio_templates/feature/login/presentation/login_page.dart';

class AppRoutes {
  static const login = '/login-page';
  static const home = '/home-page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
        case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
