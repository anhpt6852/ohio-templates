import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/common_button.dart';
import 'package:ohio_templates/core/commons/presentation/common_text_form_field.dart';
import 'package:ohio_templates/core/config/theme.dart';
import 'package:ohio_templates/core/constant/colors.dart';
import 'package:ohio_templates/feature/register/presentation/notifier/register_notifier.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, dynamic>(
        (ref) => RegisterNotifier(ref));

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBar = AppBar(
        title: Text(tr(LocaleKeys.register_title),
            style: t16M.copyWith(color: AppColors.ink[500])),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)));

    final body = Container(
        color: AppColors.ink[100],
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            CommonTextFormField(
              height: 52,
              hintText: tr(LocaleKeys.register_fullname),
              controller: ref
                  .watch(registerNotifierProvider.notifier)
                  .usernameController,
              prefixIcon: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.person, size: 24)),
              prefixBoxConstrains:
                  const BoxConstraints(maxHeight: 24, maxWidth: 32),
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return tr(LocaleKeys.error_empty_error);
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            CommonTextFormField(
              height: 52,
              keyboardType: TextInputType.phone,
              hintText: tr(LocaleKeys.register_phone),
              controller:
                  ref.watch(registerNotifierProvider.notifier).phoneController,
              prefixIcon: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.phone, size: 24)),
              prefixBoxConstrains:
                  const BoxConstraints(maxHeight: 24, maxWidth: 32),
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return tr(LocaleKeys.error_empty_error);
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            CommonTextFormField(
              height: 52,
              hintText: tr(LocaleKeys.register_password),
              controller: ref
                  .watch(registerNotifierProvider.notifier)
                  .passwordController,
              obscureText: true,
              prefixIcon: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.lock, size: 24)),
              prefixBoxConstrains:
                  const BoxConstraints(maxHeight: 24, maxWidth: 32),
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return tr(LocaleKeys.error_empty_error);
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            CommonTextFormField(
              height: 52,
              hintText: tr(LocaleKeys.register_re_password),
              controller: ref
                  .watch(registerNotifierProvider.notifier)
                  .rePasswordController,
              obscureText: true,
              prefixIcon: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.lock, size: 24)),
              prefixBoxConstrains:
                  const BoxConstraints(maxHeight: 24, maxWidth: 32),
              validator: (str) {
                if (str == null || str.isEmpty) {
                  return tr(LocaleKeys.error_empty_error);
                }
                if (ref
                        .read(registerNotifierProvider.notifier)
                        .rePasswordController !=
                    ref
                        .read(registerNotifierProvider.notifier)
                        .passwordController) {
                  return tr(LocaleKeys.error_not_same_password);
                }
                return null;
              },
            ),
          ]),
        ));

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            appBar: appBar,
            body: body,
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CommonButton(
                  child: Text(
                    tr(LocaleKeys.register_button_label),
                    style: t16M,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('haha');
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
