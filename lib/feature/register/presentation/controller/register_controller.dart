import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/utils/process_usecases.dart';
import 'package:ohio_templates/feature/register/data/repositories/register_repositories_impl.dart';
import 'package:ohio_templates/feature/register/domain/repositories/register_repositories.dart';
import 'package:ohio_templates/feature/register/domain/usecases/register.dart';

final registerControllerProvider = Provider.autoDispose((ref) {
  final registerRepositories = ref.watch(registerRepositoryProvider);
  return RegisterController(
      ref: ref, registerRepositories: registerRepositories);
});

class RegisterController {
  final ProviderRef ref;
  final RegisterRepositories registerRepositories;

  RegisterController({required this.ref, required this.registerRepositories});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  doRegister(
      {required String phoneNumber,
      required String password,
      required String email,
      required String fullname}) async {
    try {
      var result = await ref.read(registerProvider(
          phoneNumber: phoneNumber,
          password: password,
          email: email,
          fullname: fullname));
      processUsecaseResult(
          result: result,
          onSuccess: (res) {
            print(res);
          });
    } catch (e, stacktrace) {}
  }
}
