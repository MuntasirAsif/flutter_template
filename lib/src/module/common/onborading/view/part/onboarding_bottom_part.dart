import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vezy/core/static/extensions/localization_extension.dart';
import 'package:vezy/core/routes/route_const.dart';
import 'package:vezy/core/static/theme/src/theme_extensions/extensions.dart';
import 'package:vezy/core/static/theme/theme.dart';
import 'package:vezy/src/module/common/onborading/model/onboarding_model.dart';

import '../../view_model/onboarding_view_model.dart';

class OnboardingBottomPart extends ConsumerWidget {
  const OnboardingBottomPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(onboardingProvider);
    final viewModel = ref.read(onboardingProvider.notifier);
    final onboardingPages = OnboardingModel.getPages(context);
    final totalPages = onboardingPages.length + 1; // +1 for language selection

    String title;
    String description;

    if (pageIndex == 0) {
      title = "";
      description = "";
    } else {
      final currentPage = onboardingPages[pageIndex - 1];
      title = currentPage.title;
      description = currentPage.description;
    }

    return Padding(
      padding: EdgeInsets.all(const Dimensions().padding.p20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              16.verticalSpace,
              Text(
                title,
                style: context.textStyle.headingLarge,
                textAlign: TextAlign.center,
              ).animate(key: ValueKey(pageIndex + 1))..slideX(
                begin: 1,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOut,
              ),
              16.verticalSpace,
              Text(
                description,
                style: context.textStyle.bodyMedium,
                textAlign: TextAlign.center,
              ).animate(key: ValueKey(pageIndex + 2))..slideX(
                begin: 1,
                end: 0,
                duration: 700.ms,
                curve: Curves.easeOut,
              ),
              16.verticalSpace,
              DotsIndicator(
                dotsCount: totalPages,
                position: pageIndex.toDouble(),
                decorator: DotsDecorator(
                  activeColor: context.color.primary,
                  size: const Size.square(8.0),
                  activeSize: const Size(32.0, 8.0),
                  activeShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              32.verticalSpace,
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.color.primary,
              minimumSize: Size(double.infinity, 48.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  const Dimensions().radius.r16,
                ),
              ),
            ),
            onPressed: () {
              if (pageIndex < totalPages - 1) {
                viewModel.setCurrentPage(pageIndex + 1);
              } else {
                context.push(RouteConst.login);
              }
            },
            child: Text(
              context.s.next,
              style: context.textStyle.labelLarge.copyWith(
                color: context.color.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
