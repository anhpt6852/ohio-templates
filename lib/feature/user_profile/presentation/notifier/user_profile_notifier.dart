import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
import 'package:ohio_templates/feature/user_profile/data/repositories/user_profile_repositories_impl.dart';
import 'package:ohio_templates/feature/user_profile/domain/repositories/user_profile_repositories.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';

import '../../../../generated/locale_keys.g.dart';

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final UserProfileRepositories userProfileRepositories;
  UserProfileNotifier(ref)
      : userProfileRepositories = ref.read(UserProfileRepositoryProvider),
        super(const UserProfileInitial());
  final userProfileStateProvider = StateProvider<UserModel>((ref) {
    return UserModel();
  });

  Future fetchUserAvatar(WidgetRef ref) async {
    ref.watch(userProfileStateProvider.state).state.userAvatar =
        'https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png';
  }
}
