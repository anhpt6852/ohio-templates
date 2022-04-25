import 'package:dartz/dartz.dart';
import 'package:ohio_templates/core/results/failures.dart';
import 'package:ohio_templates/feature/register/data/models/register_response.dart';

abstract class RegisterRepositories {
  Future<Either<Failure, RegisterResponse>> register(
      {required String phoneNumber,
      required String password,
      required String email,
      required String fullname});
}
