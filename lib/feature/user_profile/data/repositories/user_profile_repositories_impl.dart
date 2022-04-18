import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';
import 'package:ohio_templates/feature/user_profile/domain/repositories/user_profile_repositories.dart';

final UserProfileRepositoryProvider =
    Provider.autoDispose<UserProfileRepositoriesImpl>(
        (ref) => UserProfileRepositoriesImpl());

class UserProfileRepositoriesImpl implements UserProfileRepositories {
  @override
  Future<UserModel> fetchUserCountry() async {
    return UserModel(userCountry: 'USA');
  }

  @override
  Future<UserModel> fetchUserDob() async {
    return UserModel(userDob: 'mm/dd/yyyy');
  }

  @override
  Future<UserModel> fetchUserEmail() async {
    return UserModel(userEmail: 'temp@gmail.com');
  }

  @override
  Future<UserModel> fetchUserName() async {
    return UserModel(userName: 'User1');
  }

  @override
  Future<UserModel> fetchUserAvatar() async {
    return UserModel(
        userAvatar:
            'https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png');
  }
}
