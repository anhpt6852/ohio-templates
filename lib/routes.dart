import 'package:flutter/material.dart';
import 'package:ohio_templates/feature/home/presentation/home_page.dart';
import 'package:ohio_templates/feature/login/presentation/login_page.dart';
import 'package:ohio_templates/feature/register/presentation/register_page.dart';

class AppRoutes {
  static const login = '/login-page';
  static const register = '/register-page';
  static const home = '/home-page';
}

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
    }
    return null;
  }
}
