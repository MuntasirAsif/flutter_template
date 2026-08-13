import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/routes/route_const.dart';
import '../../../../../../core/static/theme/theme.dart';
import '../../../../../widgets/app_text_field.dart';
import '../../view_model/login_view_model.dart';
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
          AppTextField(
            controller: emailController,
            label: 'Email',
            hintText: 'Enter your email',
            obscureText: false,
            enableInvalidShake: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          AppTextField(
            controller: passwordController,
            label: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            enableInvalidShake: true,
          ),
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
            onPressed: () {
              context.push(RouteConst.homeScreen);
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
