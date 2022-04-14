import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/login/data/repositories/login_repositories_impl.dart';
import 'package:ohio_templates/feature/login/domain/repositories/login_repositories.dart';
import 'package:ohio_templates/feature/login/presentation/notifier/state/login_state.dart';

import '../../../../generated/locale_keys.g.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepositories loginRepositories;
  LoginNotifier(ref)
      : loginRepositories = ref.read(loginRepositoryProvider),
        super(const LoginInitial());

  checkInvalidPhone(GlobalKey<FormState> key) async {
    if (key.currentState != null && key.currentState!.validate()) {
      final login = await loginRepositories.fetchUsername();
      state = const LoginLoaded();
    } else {
      state = LoginError(tr(LocaleKeys.error_invalid_phone));
    }
  }
}
