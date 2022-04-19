import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/login/data/models/login_model.dart';
import 'package:ohio_templates/feature/login/data/repositories/login_repositories_impl.dart';
import 'package:ohio_templates/feature/login/domain/repositories/login_repositories.dart';
import 'package:ohio_templates/feature/login/presentation/notifier/state/login_state.dart';
import 'package:ohio_templates/routes.dart';

import '../../../../generated/locale_keys.g.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepositories loginRepositories;
  LoginNotifier(ref)
      : loginRepositories = ref.read(loginRepositoryProvider),
        super(const LoginInitial());

  final loginStateProvider = StateProvider<LoginModel>((ref) {
    return const LoginModel(userName: '');
  });

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  checkInvalidPhone(GlobalKey<FormState> key, WidgetRef ref) async {
    if (key.currentState != null && key.currentState!.validate()) {
      ref.read(loginStateProvider.state).state =
          await loginRepositories.fetchUsername();
      state = const LoginLoaded();
    } else {
      state = LoginError(tr(LocaleKeys.error_invalid_phone));
    }
  }

  login(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.userProfile, (Route<dynamic> route) => false);
  }
}
