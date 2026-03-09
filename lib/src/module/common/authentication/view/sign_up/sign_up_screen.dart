import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/static/const/app_images.dart';
import '../../../../../../core/static/extensions/localization_extension.dart';
import '../../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../../core/static/theme/theme.dart';
import 'part/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: const Dimensions().padding.p16.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(AppImages.logoFull, width: 60.w, height: 60.h),
            ),
            10.verticalSpace,
            Center(
              child: Text(
                context.s.sign_up,
                style: context.textStyle.headingLarge.copyWith(
                  color: context.color.primary,
                ),
              ),
            ),
            8.verticalSpace,
            Center(
              child: Text(
                context.s.create_your_account_it_s_quick_and_easy,
                style: context.textStyle.bodyMedium,
              ),
            ),
            20.verticalSpace,

            // Form
            const Expanded(child: SignUpForm()),
          ],
        ),
      ),
    );
  }
}
