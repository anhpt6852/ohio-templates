import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/user_profile_notifier.dart';

final userProfileStateProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  return UserProfileNotifier(ref);
});

class ProfilePic extends ConsumerWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileAvaState = ref.watch(userProfileStateProvider.notifier);

    return FutureBuilder(
      future: profileAvaState.fetchUserInfo(ref),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            child: Image.network(ref
                .watch(profileAvaState.userProfileProvider.notifier)
                .state
                .userAvatar!),
          ),
        );
      },
    );
  }
}
