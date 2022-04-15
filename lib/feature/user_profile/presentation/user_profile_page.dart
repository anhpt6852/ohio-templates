import 'package:flutter/material.dart';
import 'package:ohio_templates/core/constant/colors.dart';

import 'widgets/user_profile_info.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink[0],
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: UserProfileInfo(),
    );
  }
}
