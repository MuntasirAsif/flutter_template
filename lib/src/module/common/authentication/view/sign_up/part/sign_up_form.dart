import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/static/extensions/localization_extension.dart';
import '../../../../../../../core/static/theme/theme.dart';
import 'service_provider_form.dart';
import 'user_form.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: context.color.icon.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: context.color.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.symmetric(horizontal: 24.w),
              dividerColor: Colors.transparent,
              dividerHeight: 0,
              labelStyle: context.textStyle.bodyLarge.copyWith(
                color: context.color.scaffoldBackground,
              ),
              splashBorderRadius: BorderRadius.circular(50),
              tabs: [
                Tab(
                  child: Text(
                    context.s.user,
                    style: context.textStyle.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    context.s.provider,
                    style: context.textStyle.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          const Expanded(
            child: TabBarView(children: [UserForm(), ServiceProviderForm()]),
          ),
        ],
      ),
    );
  }
}
