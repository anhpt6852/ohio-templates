import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/user_profile_notifier.dart';
import 'package:ohio_templates/generated/assets.gen.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';

final userProfileStateProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  return UserProfileNotifier(ref);
});

class ProfilePic extends ConsumerWidget {
  ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileState = ref.watch(userProfileStateProvider.notifier);
    profileState.fetchUserAvatar(ref);
    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        child: Image.network(ref
            .watch(profileState.userProfileProvider.notifier)
            .state
            .userAvatar!),
      ),
    );
  }
}
