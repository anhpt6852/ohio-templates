import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ohio_templates/core/config/theme.dart';
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
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)), // Need to back to previous page. (Required almost page)
        centerTitle: true, // Move title to center
        title: Text(
          tr(LocaleKeys.profile_title), // Missing tr() to render LocaleKeys...
          style: t16M.copyWith(
            color: AppColors.ink[500], // Add color to text. Default color is white like backgroundcolor app.
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            ProfilePic(),
            Divider(
              color: Colors.white,
              height: 24,
            ),
            UserProfileInfo(),
          ],
        ),
      ),
    );
  }
}
