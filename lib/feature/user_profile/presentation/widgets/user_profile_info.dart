import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/common_button.dart';
import 'package:ohio_templates/core/config/theme.dart';

import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/user_profile_notifier.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/profile_pic.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';

final userInfoStateProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  return UserProfileNotifier(ref);
});

class UserProfileInfo extends ConsumerWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileInfoState = ref.watch(userProfileStateProvider.notifier);
    profileInfoState.fetchUserName(ref);
    profileInfoState.fetchUserDob(ref);
    profileInfoState.fetchUserCountry(ref);
    profileInfoState.fetchUserEmail(ref);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(Icons.person_add_alt_1),
          title: Text(ref
              .watch(profileInfoState.userProfileProvider.notifier)
              .state
              .userName!),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(Icons.cake),
          title: Text(ref
              .watch(profileInfoState.userProfileProvider.notifier)
              .state
              .userDob!),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(Icons.map),
          title: Text(ref
              .watch(profileInfoState.userProfileProvider.notifier)
              .state
              .userCountry!),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(Icons.email),
          title: Text(ref
              .watch(profileInfoState.userProfileProvider.notifier)
              .state
              .userEmail!),
        ),
      ),
    ]);
  }
}
