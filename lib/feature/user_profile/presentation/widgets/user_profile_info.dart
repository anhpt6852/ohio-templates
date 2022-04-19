import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/common_button.dart';
import 'package:ohio_templates/core/config/theme.dart';

import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/state/user_profile_state.dart';
import 'package:ohio_templates/feature/user_profile/presentation/notifier/user_profile_notifier.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/profile_pic.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';

final userInfoStateProvider = StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  return UserProfileNotifier(ref);
});

class UserProfileInfo extends ConsumerWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    profileInfoState = ref.watch(userProfileStateProvider.notifier);
    
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ListTile(
              
            )
        //     child: Row(
        //       children: [
        //         Icon(Icons.person),
        //         SizedBox(width: 20),
        //         Expanded(
        //             child: Text(UserModel.userName, style: t48M.copyWith())),
        //       ],
        //     )),
        // ElevatedButton(
        //     onPressed: () {},
        //     child: Row(
        //       children: [
        //         Icon(Icons.cake),
        //         SizedBox(width: 20),
        //         Expanded(child: Text(UserModel.userDob, style: t48M.copyWith())),
        //       ],
        //     )),
        // ElevatedButton(
        //     onPressed: () {},
        //     child: Row(
        //       children: [
        //         Icon(Icons.map),
        //         SizedBox(width: 20),
        //         Expanded(child: Text(UserModel.userCountry, style: t48M)),
        //       ],
        //     )),
        // ElevatedButton(
        //     onPressed: () {},
        //     child: Row(
        //       children: [
        //         Icon(Icons.email),
        //         SizedBox(width: 20),
        //         Expanded(child: Text(UserModel.userEmail, style: t48M)),
        //       ],
        //     )),
          );
      ],
  }
}
