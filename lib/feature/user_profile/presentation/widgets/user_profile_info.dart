import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/common_loading.dart';
import 'package:ohio_templates/core/commons/presentation/snack_bar.dart';
import 'package:ohio_templates/core/constant/colors.dart';
import 'package:ohio_templates/feature/user_profile/presentation/controller/user_profile_controller.dart';

class UserProfileInfo extends ConsumerWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserInfoProvider).when(
        data: ((data) {
          return Column(children: [
            Divider(
              // height: 24, Don't need that
              color: AppColors.ink[0], //color: Colors.white, Limit use that. Should use AppColors (custom Color follow design)
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.ink[100], //...
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 1.2)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.person_add_alt_1),
                title: Text(data.userName!),
              ),
            ),
            Divider(
              // height: 16, 
              color: AppColors.ink[0],
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.ink[100],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 1.2)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.cake),
                title: Text(data.userDob!),
              ),
            ),
            Divider(
              // height: 16, 
              color: AppColors.ink[0],
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.ink[100],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 1.2)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.map),
                title: Text(data.userCountry!),
              ),
            ),
            Divider(
              // height: 16, 
              color: AppColors.ink[0],
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.ink[100],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 1.2)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.email),
                title: Text(data.userEmail!),
              ),
            ),
          ]);
        }),
        error: (e, stack) => CommonSnackbar.show(context,
            type: SnackbarType.error, message: e.toString()),
        loading: () => const CommonLoading());
  }
}
