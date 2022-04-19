import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
import 'package:ohio_templates/feature/user_profile/data/repositories/user_profile_repositories_impl.dart';
import 'package:ohio_templates/feature/user_profile/domain/repositories/user_profile_repositories.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final UserProfileRepositories userProfileRepositories;
  UserProfileNotifier(ref)
      : userProfileRepositories = ref.read(userProfileRepositoryProvider),
        super(const UserProfileInitial());

  final profileNameController = TextEditingController();
  final profileEmailController = TextEditingController();
  final profileCountryController = TextEditingController();
  // final profileDobController =

  final userProfileProvider = StateProvider<UserModel>((ref) {
    return UserModel();
  });

  fetchUserInfo(WidgetRef ref) {
    ref.watch(userProfileProvider.state).state =
        userProfileRepositories.fetchUserInfo() as UserModel;
  }
}
