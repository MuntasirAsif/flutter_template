import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vezy/core/static/extensions/localization_extension.dart';
import 'package:vezy/core/static/theme/theme.dart';
import 'package:vezy/core/static/const/app_icons.dart';
import 'package:vezy/core/routes/route_const.dart';
import 'booking_history/part/provider_all_bookings_part.dart';
import 'booking_history/part/provider_cancel_booking_part.dart';
import 'booking_history/part/provider_completed_bookings_part.dart';
import 'booking_history/part/provider_pending_booking_part.dart';

class ProviderBookingHistoryScreen extends ConsumerWidget {
  const ProviderBookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.s.booking_request),
          actions: [
            GestureDetector(
              onTap: () {
                context.push(RouteConst.notifications);
              },
              child: CircleAvatar(
                backgroundColor: context.color.primary.withValues(alpha: 0.1),
                child: SvgPicture.asset(
                  AppIcons.notification,
                  colorFilter: ColorFilter.mode(
                    context.color.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800.w),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(12.r),
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: const Color(0xff333333).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    indicator: BoxDecoration(
                      color: context.color.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    dividerHeight: 0,
                    labelColor: Colors.white,
                    unselectedLabelColor: context.color.text.primary,
                    tabs: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Tab(text: context.s.all),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Tab(text: context.s.completed),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Tab(text: context.s.pending),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Tab(text: context.s.cancelled),
                      ),
                    ],
                  ),
                ),

                /// Tab Views
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.padding.p16.w,
                          vertical: context.padding.p8.h,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: context.s.search,
                            suffixIcon: Icon(
                              Icons.search,
                              color: context.color.text.primary,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            ProviderAllBookingsPart(),
                            ProviderCompletedBookingsPart(),
                            ProviderPendingBookingPart(),
                            ProviderCancelBookingsPart(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
