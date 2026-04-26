import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/static/theme/theme.dart';
import '../../../../../widgets/custom_network_Image.dart';
import 'widget/home_shortcut_widget.dart';

part 'part/user_information_part.dart';
part 'part/home_stats_part.dart';
part 'part/practice_questions_part.dart';
part 'part/unlock_premium_part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            UserInformationPart(),
            20.verticalSpace,
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  HomeStatsPart(),
                  20.verticalSpace,
                  SizedBox(
                    height: 95.h,
                    child: Row(
                      spacing: 12.w,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: HomeShortCutWidget(
                            title: 'Daily Habits',
                            description: 'Explore activities',
                            icon: Icons.list_alt,
                            color: context.color.primary,
                          ),
                        ),
                        Expanded(
                          child: HomeShortCutWidget(
                            title: 'Message',
                            description: '3 unread',
                            icon: Icons.message,
                            color: context.color.accent.yellow,
                          ),
                        ),
                        Expanded(
                          child: HomeShortCutWidget(
                            title: 'Progress',
                            description: 'View your journey',
                            icon: Icons.pie_chart,
                            color: context.color.accent.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  PracticeQuestionPart(),
                  10.verticalSpace,
                  UnlockPremiumPart(),
                  30.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
