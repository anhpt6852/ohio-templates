import 'package:flutter/material.dart';
import 'package:ohio_templates/feature/home/presentation/home_page.dart';
import 'package:ohio_templates/feature/login/presentation/login_page.dart';
import 'package:ohio_templates/feature/register/presentation/register_page.dart';
import 'package:ohio_templates/feature/user_profile/presentation/user_profile_page.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/user_profile_config.dart';

class AppRoutes {
  static const login = '/login-page';
  static const register = '/register-page';
  static const home = '/home-page';
  static const userProfileConfig = '/user-profile-config';
  static const userProfile = '/user-profile-page';
  AppRoutes(Type userProfileConfig);
}

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case AppRoutes.userProfile:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const UserProfilePage(),
          settings: settings,
        );
      case AppRoutes.userProfileConfig:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const UserProfileConfig(),
          settings: settings,
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: settings,
        );
    }
    return null;
  }
}
