import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userName;
  final String? userDob;
  final String? userCountry;
  final String? userEmail;
  String? userAvatar;

  UserModel({
    this.userName,
    this.userDob,
    this.userCountry,
    this.userEmail,
    this.userAvatar,
  });

  @override
  List<Object?> get props => [
        userName,
        userDob,
        userCountry,
        userEmail,
        userAvatar,
      ];
}
