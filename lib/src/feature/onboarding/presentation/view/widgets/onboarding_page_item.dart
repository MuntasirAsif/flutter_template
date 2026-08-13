import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/static/theme/theme.dart';
import 'onboarding_page_data.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingPageData page;
  final bool isActive;
  final int totalPages;
  final VoidCallback onNext;

  const OnboardingPageItem({
    super.key,
    required this.page,
    required this.isActive,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(page.image, height: 400.h, fit: BoxFit.contain),
        SizedBox(height: 40.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: context.color.scaffoldBackground),
            child: Column(
              children: [
                Text(
                  page.title,
                  style: context.textStyle.headlineLarge.copyWith(
                    color: context.color.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.spacing.s16.h),
                Text(
                  page.description,
                  style: context.textStyle.bodyMedium.copyWith(
                    color: context.color.text.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(context.padding.p24.r),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          totalPages,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(
                              horizontal: context.spacing.s4.w,
                            ),
                            width: isActive ? 24.w : 8.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? context.color.primary
                                  : context.color.disabled,
                              borderRadius: BorderRadius.circular(
                                context.radius.r4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.spacing.s24.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: FilledButton(
                          onPressed: onNext,
                          child: Text(isActive ? 'Get Started' : 'Next'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
