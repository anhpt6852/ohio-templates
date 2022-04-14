import 'package:flutter/material.dart';
import 'package:ohio_templates/feature/login/presentation/login_page.dart';
import 'package:ohio_templates/feature/user_profile/presentation/user_profile_page.dart';

class AppRoutes {
  static const login = '/login-page';
  static const countriesPage = '/countries-page';
  static const signInPhonePage = '/sign-in-phone-page';
  static const signInVerificationPage = '/sign-in-verification-page';
  static const userProfile = '/user-profile-page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LoginPage(),
          settings: settings,
        );
      case AppRoutes.userProfile:
        return MaterialPageRoute<dynamic>(builder: (_) => UserProfilePage());
      default:
        return null;
    }
  }
}
