import 'package:flutter/material.dart';
import 'package:ohio_templates/core/constant/colors.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/profile_pic.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';

import 'widgets/user_profile_info.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink[0],
      appBar: AppBar(
        title: const Text(LocaleKeys.profile_title),
      ),
      body: Column(
        children: const [
          SizedBox(height: 16),
          ProfilePic(),
          Divider(height: 24),
          UserProfileInfo(),
        ],
      ),
    );
  }
}
