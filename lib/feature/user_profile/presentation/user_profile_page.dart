import 'package:flutter/material.dart';
import 'package:ohio_templates/core/commons/presentation/common_button.dart';
import 'package:ohio_templates/core/constant/colors.dart';
import 'package:ohio_templates/feature/user_profile/presentation/widgets/profile_pic.dart';
import 'package:ohio_templates/routes.dart';

import 'widgets/user_profile_info.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink[0],
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          CommonButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.userProfileConfig))
        ],
      ),
      body: Column(
        children: [
          ProfilePic(),
          const Spacer(),
          UserProfileInfo(),
        ],
      ),
    );
  }
}
