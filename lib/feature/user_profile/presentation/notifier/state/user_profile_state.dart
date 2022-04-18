import 'package:equatable/equatable.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();
}

class UserProfileInitial extends UserProfileState {
  const UserProfileInitial();

  @override
  List<Object> get props => [];
}

class UserProfileLoading extends UserProfileState {
  const UserProfileLoading();

  @override
  List<Object> get props => [];
}

class UserProfileLoaded extends UserProfileState {
  const UserProfileLoaded();

  @override
  List<Object> get props => [];
}

class UserProfileError extends UserProfileState {
  final String message;
  const UserProfileError(this.message);

  @override
  List<Object> get props => [];
}
