import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/snack_bar.dart';
import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
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

    return FutureBuilder<UserModel>(
      future: profileAvaState.fetchUserInfo(ref),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              child: Image.network(
                snapshot.data!.userAvatar!,
                
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return CommonSnackbar.show(context,
              type: SnackbarType.error, message: snapshot.error.toString());
        }

        // By default, show a loading spinner.
        return const Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ));
      },
    );
  }
}
