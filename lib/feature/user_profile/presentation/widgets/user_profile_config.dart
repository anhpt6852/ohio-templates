import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/common_button.dart';
import 'package:ohio_templates/core/commons/presentation/common_text_form_field.dart';
import 'package:ohio_templates/core/config/theme.dart';
import 'package:ohio_templates/core/constant/colors.dart';
import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
import 'package:ohio_templates/feature/user_profile/presentation/controller/user_profile_controller.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';

// final profileConfigNotifierProvider =
//     StateNotifierProvider<UserProfileNotifier, UserProfileState>(
//         (ref) => UserProfileNotifier(ref));
// class UserProfileConfig extends StatelessWidget {
//   const UserProfileConfig({Key? key}) : super(key: key);

class UserProfileConfig extends ConsumerWidget {
  UserProfileConfig({Key? key}) : super(key: key);

  final _formKeyProfileConfig = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(userProfileControllerProvider);
    return ref.watch(fetchUserInfoProvider).when(data: ((data) {
      return Column(children: [
        Divider(
          color: AppColors.ink[0],
        ),
        Container(
            decoration: BoxDecoration(
                color: AppColors.ink[100], //...
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 1.2, color: AppColors.ink[0]!)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Form(
                key: _formKeyProfileConfig,
                child: CommonTextFormField(
                  labelText: tr(LocaleKeys.profile_name),
                  controller: controller.profileNameController.text
                      .toString(data.userName),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
              );
            })),
        Divider(
          color: AppColors.ink[0],
        ),
        Container(
            decoration: BoxDecoration(
                color: AppColors.ink[100], //...
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 1.2, color: AppColors.ink[0]!)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Form(
                key: _formKeyProfileConfig,
                child: CommonTextFormField(
                  labelText: tr(LocaleKeys.profile_dob),
                  controller: controller.profileDobController.text
                      .toString(data.userDob),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
              );
            })),
        Divider(
          color: AppColors.ink[0],
        ),
        Container(
            decoration: BoxDecoration(
                color: AppColors.ink[100], //...
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 1.2, color: AppColors.ink[0]!)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Form(
                key: _formKeyProfileConfig,
                child: CommonTextFormField(
                  labelText: tr(LocaleKeys.profile_email),
                  controller: controller.profileEmailController.text
                      .toString(data.userEmail),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
              );
            })),
        Divider(
          color: AppColors.ink[0],
        ),
        Container(
            decoration: BoxDecoration(
                color: AppColors.ink[100], //...
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 1.2, color: AppColors.ink[0]!)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Form(
                key: _formKeyProfileConfig,
                child: CommonTextFormField(
                  labelText: tr(LocaleKeys.profile_country),
                  controller: controller.profileCountryController.text
                      .toString(data.userCountry),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
              );
            })),
        Divider(
          color: AppColors.ink[0],
        ),
        CommonButton(
            child: Text(tr(LocaleKeys.profile_save), style: t16M),
            onPressed: () {
              if (_formKeyProfileConfig.currentState!.validate()) {
                if (controller.profileNameController.text.isEmpty ||
                    controller.profileDobController.text.isEmpty ||
                    controller.profileEmailController.text.isEmpty ||
                    controller.profileCountryController.text.isEmpty) {
                  //
                }
              }
            })
      ]);
    }));
  }
}
