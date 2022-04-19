import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/snack_bar.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/user_profile_notifier.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/profile_pic.dart';

final userInfoStateProvider =
    StateNotifierProvider.autoDispose<UserProfileNotifier, UserProfileState>(
        (ref) {
  return UserProfileNotifier(ref);
});

class UserProfileInfo extends ConsumerWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileInfoState = ref.watch(userProfileStateProvider.notifier);

    return FutureBuilder(
      future: profileInfoState.fetchUserInfo(ref),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1.0)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.person_add_alt_1),
                title: Text(ref
                    .watch(profileInfoState.userProfileProvider.notifier)
                    .state
                    .userName!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                leading: const Icon(Icons.cake),
                title: Text(ref
                    .watch(profileInfoState.userProfileProvider.notifier)
                    .state
                    .userDob!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                leading: const Icon(Icons.map),
                title: Text(ref
                    .watch(profileInfoState.userProfileProvider.notifier)
                    .state
                    .userCountry!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                leading: const Icon(Icons.email),
                title: Text(ref
                    .watch(profileInfoState.userProfileProvider.notifier)
                    .state
                    .userEmail!),
              ),
            ),
          ]);
        } else if (snapshot.hasError) {
          return CommonSnackbar.show(context,
              type: SnackbarType.error, message: snapshot.error.toString());
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
