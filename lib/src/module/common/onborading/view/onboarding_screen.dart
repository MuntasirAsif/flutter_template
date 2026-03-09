import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vezy/core/static/theme/src/theme_extensions/extensions.dart';
import 'package:vezy/core/static/theme/theme.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vezy/core/static/extensions/localization_extension.dart';
import 'package:vezy/src/module/common/onborading/view/part/language_selection_part.dart';

import '../../../../../core/routes/route_const.dart';
import '../view_model/onboarding_view_model.dart';
import 'part/onboarding_bottom_part.dart';
import 'part/onboarding_top_part.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(Colors.white, context.color.primary, 0.2),

      body: Consumer(
        builder: (context, ref, child) {
          final pageIndex = ref.watch(onboardingProvider);
          if (pageIndex == 0) {
            return Container(
              color: context.color.scaffoldBackground,
              child: Column(
                children: [
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          context.push(RouteConst.login);
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            const Dimensions().spacing.s6,
                          ),
                          margin: EdgeInsets.all(const Dimensions().spacing.s6),
                          decoration: BoxDecoration(
                            color: context.color.primary.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(
                              const Dimensions().radius.r16,
                            ),
                          ),
                          child: Text(
                            context.s.skip,
                            style: context.textStyle.labelMedium.copyWith(
                              color: context.color.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: const Dimensions().padding.p16,
                    ),
                    child: Column(
                      children: [
                        Text(
                          context.s.choose_language,
                          style: context.textStyle.headingMedium,
                        ),
                        10.verticalSpace,
                        Text(
                          context.s.reliable_affordable_and_professional_get_the_best,
                          style: context.textStyle.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        50.verticalSpace,
                        const LanguageSelectionPart(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: pageIndex == 0
                          ? Colors.transparent
                          : context.color.scaffoldBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(const Dimensions().radius.r30),
                        topRight: Radius.circular(
                          const Dimensions().radius.r30,
                        ),
                      ),
                    ),
                    child: const OnboardingBottomPart(),
                  ),
                ],
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: const Dimensions().padding.p16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (pageIndex != 0) ...[
                        SafeArea(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                context.push(RouteConst.login);
                              },
                              child: Container(
                                padding: EdgeInsets.all(
                                  const Dimensions().spacing.s6,
                                ),
                                margin: EdgeInsets.all(
                                  const Dimensions().spacing.s6,
                                ),
                                decoration: BoxDecoration(
                                  color: context.color.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    const Dimensions().radius.r16,
                                  ),
                                ),
                                child: Text(
                                  context.s.skip,
                                  style: context.textStyle.labelMedium.copyWith(
                                    color: context.color.primary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(child: OnboardingTopPart()),
                      ],
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.color.scaffoldBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(const Dimensions().radius.r30),
                      topRight: Radius.circular(const Dimensions().radius.r30),
                    ),
                  ),
                  child: const OnboardingBottomPart(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
