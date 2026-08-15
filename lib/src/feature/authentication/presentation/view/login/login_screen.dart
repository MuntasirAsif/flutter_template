import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/static/theme/theme.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding.p16.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.verticalSpace,
                Assets.images.appIcon.image(height: 200.h),
                10.verticalSpace,
                Text(
                  'Sign In',
                  style: context.textStyle.headlineLarge.copyWith(
                    color: context.color.primary,
                  ),
                ),
                8.verticalSpace,
                Text(
                  'Log in to your account',
                  style: context.textStyle.bodyMedium,
                ),
                20.verticalSpace,

                // Form
                const SignInForm(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: context.textStyle.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Create account',
                        style: context.textStyle.bodyMedium.copyWith(
                          color: context.color.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: context.color.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Center(child: Text('or', style: context.textStyle.bodyMedium)),
                20.verticalSpace,

                // google sign in button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
