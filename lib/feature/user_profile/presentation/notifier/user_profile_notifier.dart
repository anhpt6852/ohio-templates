import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
import 'package:ohio_templates/feature/user_profile/data/repositories/user_profile_repositories_impl.dart';
import 'package:ohio_templates/feature/user_profile/domain/repositories/user_profile_repositories.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/profile_pic.dart';

import '../../../../generated/locale_keys.g.dart';

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final UserProfileRepositories userProfileRepositories;
  UserProfileNotifier(ref)
      : userProfileRepositories = ref.read(UserProfileRepositoryProvider),
        super(const UserProfileInitial());

  final profileNameController = TextEditingController();
  final profileEmailController = TextEditingController();
  final profileCountryController = TextEditingController();
  // final profileDobController =

  final userProfileProvider = StateProvider<UserModel>((ref) {
    return UserModel();
  });

  fetchUserAvatar(WidgetRef ref) {
    ref.watch(userProfileProvider.state).state.userAvatar =
        'https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png';
  }

  fetchUserName(WidgetRef ref) {
    ref.watch(userProfileProvider.state).state.userName = 'User1';
  }

  fetchUseCountry(WidgetRef ref) {
    ref.watch(userProfileProvider.state).state.userCountry = 'USA';
  }

  fetchUserEmail(WidgetRef ref) {
    ref.watch(userProfileProvider.state).state.userEmail = 'temp@gmail.com';
  }

  fetchUserDob(WidgetRef ref) {
    ref.watch(userProfileProvider.state).state.userDob = '28/07/1997';
  }
}
