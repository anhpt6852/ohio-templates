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
  static Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final Animatable<double> _tween = Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.linear));

        return FadeTransition(
          opacity: animation.drive(_tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500),
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return _createRoute(const LoginPage());
      case AppRoutes.home:
        return _createRoute(const HomePage());
      case AppRoutes.userProfile:
        return _createRoute(const UserProfilePage());
      // case AppRoutes.userProfileConfig:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const UserProfileConfig(),
      //     settings: settings,
      //   );
      case AppRoutes.register:
        return _createRoute(RegisterPage());
    }
    return null;
  }
}
