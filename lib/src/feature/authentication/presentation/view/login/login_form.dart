import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/static/theme/theme.dart';
import '../../../../../widgets/custom_toast.dart';
import '../../../data/model/login_model.dart';
import '../../view_model/login_view_model.dart';
import 'widgets/login_form_fields.dart';
import 'widgets/sign_in_button.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailField(controller: emailController),
          PasswordField(controller: passwordController),
          5.verticalSpace,
          Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return Checkbox(
                    value: ref.watch(loginRememberMeProvider),
                    onChanged: (value) {
                      ref.read(loginRememberMeProvider.notifier).state =
                          value ?? false;
                    },
                  );
                },
              ),
              Text('Remember me', style: context.textStyle.bodyMedium),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot password?',
                  style: context.textStyle.bodyMedium.copyWith(
                    color: context.color.primary,
                  ),
                ),
              ),
            ],
          ),
          20.verticalSpace,
          SignInButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await ref
                    .read(loginViewModelProvider.notifier)
                    .login(
                      LoginModel(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      ),
                      rememberMe: ref.read(loginRememberMeProvider),
                    );

                if (!context.mounted) return;

                final loginState = ref.read(loginViewModelProvider);
                if (loginState.hasError) {
                  CustomToast.showError(
                    context,
                    title: 'Error',
                    description: loginState.error.toString(),
                  );
                } else {
                  CustomToast.showSuccess(
                    context,
                    title: 'Success',
                    description: 'Login successfully!',
                  );
                }
              }
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
