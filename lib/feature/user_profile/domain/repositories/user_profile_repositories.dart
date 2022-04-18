import 'package:ohio_templates/feature/user_profile/data/models/user_profile_model.dart';

abstract class UserProfileRepositories {
  Future<UserModel> fetchUserName();
  Future<UserModel> fetchUserDob();
  Future<UserModel> fetchUserCountry();
  Future<UserModel> fetchUserEmail();
  Future<UserModel> fetchUserAvatar();
}
