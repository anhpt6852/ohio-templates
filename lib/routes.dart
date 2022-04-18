import 'package:flutter/material.dart';
import 'package:ohio_templates/feature/home/presentation/home_page.dart';
import 'package:ohio_templates/feature/login/presentation/login_page.dart';
import 'package:ohio_templates/feature/user_profile/presentation/user_profile_page.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/user_profile_config.dart';

class AppRoutes {
  static const login = '/login-page';
  static const countriesPage = '/countries-page';
  static const signInPhonePage = '/sign-in-phone-page';
  static const signInVerificationPage = '/sign-in-verification-page';
  static const userProfile = '/user-profile-page';
  static const home = '/home-page';
  static const userProfileConfig = '/user-profile-config';

  AppRoutes(Type userProfileConfig);
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
      default:
        return null;
    }
  }
}
