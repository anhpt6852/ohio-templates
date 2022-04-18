import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/generated/assets.gen.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';

final userProfileStateProvider = StateNotifierProvider<String>((ref) async {
  final userPic = UserModel.userAvatar;
  return Image.asset('');
});

class ProfilePic extends ConsumerWidget {
  ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: ref.watch(userProfileStateProvider),
      ),
    );
  }
}
