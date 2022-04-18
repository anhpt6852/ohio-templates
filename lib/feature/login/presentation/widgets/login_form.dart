import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohio_templates/core/commons/presentation/common_button.dart';
import 'package:ohio_templates/core/commons/presentation/common_text_form_field.dart';
import 'package:ohio_templates/core/config/theme.dart';
import 'package:ohio_templates/core/constant/colors.dart';
import 'package:ohio_templates/feature/login/presentation/notifier/login_notifier.dart';
import 'package:ohio_templates/feature/login/presentation/notifier/state/login_state.dart';
import 'package:ohio_templates/generated/locale_keys.g.dart';
import 'package:ohio_templates/routes.dart';

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
    (ref) => LoginNotifier(ref));

class LoginForm extends ConsumerWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.ink[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: SafeArea(
                child: SizedBox(
                    width: double.infinity,
                    child: SafeArea(
                      top: false,
                      left: false,
                      right: false,
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 32.0),
                                  CommonTextFormField(
                                    labelText:
                                        tr(LocaleKeys.login_usernameLabel),
                                    controller: ref
                                        .watch(loginNotifierProvider.notifier)
                                        .usernameController,
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.done,
                                    onChanged: (str) {
                                      ref
                                          .read(loginNotifierProvider.notifier)
                                          .checkInvalidPhone(_formKey, ref);
                                    },
                                    validator: (str) {
                                      if (str == null || str.isEmpty) {
                                        return tr(LocaleKeys.error_empty_error);
                                      }
                                      if (str.length < 10) {
                                        return tr(
                                            LocaleKeys.error_invalid_phone);
                                      }
                                      return null;
                                    },
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    transitionBuilder: (Widget child,
                                            Animation<double> animation) =>
                                        SizeTransition(
                                            child: child,
                                            sizeFactor: animation),
                                    child: ref.watch(loginNotifierProvider) ==
                                            const LoginLoaded()
                                        ? Column(
                                            children: [
                                              const SizedBox(height: 16),
                                              CommonTextFormField(
                                                labelText: tr(LocaleKeys
                                                    .login_passwordLabel),
                                                controller: ref
                                                    .watch(loginNotifierProvider
                                                        .notifier)
                                                    .passwordController,
                                                textInputAction:
                                                    TextInputAction.done,
                                                obscureText: true,
                                                onChanged: (str) {},
                                                onFieldSubmitted: (_) {},
                                                validator: (str) {
                                                  if (str == null ||
                                                      str.isEmpty) {
                                                    return tr(LocaleKeys
                                                        .error_empty_error);
                                                  }
                                                  return null;
                                                },
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Text(
                                                    tr(LocaleKeys
                                                        .login_forget_password_label),
                                                    style: t16M.apply(
                                                        color:
                                                            AppColors.primary),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  const SizedBox(height: 16),
                                  CommonButton(
                                      child: Text(
                                        tr(LocaleKeys.login_loginButtonLabel),
                                        style: t16M,
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          ref
                                              .read(loginNotifierProvider
                                                  .notifier)
                                              .login(context);
                                        }
                                      }),
                                  const SizedBox(height: 16),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    transitionBuilder: (Widget child,
                                            Animation<double> animation) =>
                                        SizeTransition(
                                            child: child,
                                            sizeFactor: animation),
                                    child: ref.watch(loginNotifierProvider) ==
                                            const LoginLoaded()
                                        ? const SizedBox.shrink()
                                        : Align(
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: tr(LocaleKeys
                                                          .login_register_label),
                                                      style: t14M.apply(
                                                          color: AppColors
                                                              .ink[400])),
                                                  const WidgetSpan(
                                                      child:
                                                          SizedBox(width: 4)),
                                                  WidgetSpan(
                                                      child: GestureDetector(
                                                          onTap: () => Navigator
                                                              .pushNamed(
                                                                  context,
                                                                  AppRoutes
                                                                      .register),
                                                          child: Text(
                                                              tr(LocaleKeys
                                                                  .login_register_suggest),
                                                              style: t14M.apply(
                                                                  color: AppColors
                                                                      .primary))))
                                                ]),
                                              ),
                                            ),
                                          ),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )))));
  }
}
