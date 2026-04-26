import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/static/extensions/localization_extension.dart';
import '../../../../../../core/static/theme/theme.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600.w),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.padding.p16.r,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    50.verticalSpace,
                    
                    10.verticalSpace,
                    Center(
                      child: Text(
                        context.s.sign_in,
                        style: context.textStyle.headingLarge.copyWith(
                          color: context.color.primary,
                        ),
                      ),
                    ),
                    8.verticalSpace,
                    Center(
                      child: Text(
                        context.s.log_in_to_your_account,
                        style: context.textStyle.bodyMedium,
                      ),
                    ),
                    20.verticalSpace,

                    // Form
                    const SignInForm(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.s.don_t_have_an_account,
                          style: context.textStyle.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Text(
                            context.s.create_account,
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
                    Center(
                      child: Text(
                        context.s.or,
                        style: context.textStyle.bodyMedium,
                      ),
                    ),
                    20.verticalSpace,
                    // google sign in button
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
