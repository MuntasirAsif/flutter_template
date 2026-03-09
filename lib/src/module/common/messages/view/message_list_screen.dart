import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_const.dart';
import '../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../core/static/theme/theme.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: const Text("Messages")),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    itemCount: 1000,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: context.color.border),
                          borderRadius: BorderRadius.circular(
                            const Dimensions().radius.r12.r,
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            context.push(RouteConst.conversation);
                          },
                          leading: const CircleAvatar(),
                          title: Text(
                            "Jane Cooper",
                            style: context.textStyle.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "What should we call you?",
                            style: context.textStyle.bodySmall.copyWith(
                              color: context.color.text.secondary,
                            ),
                          ),
                          trailing: Column(
                            children: [
                              Text(
                                "2:30 PM",
                                style: context.textStyle.bodySmall.copyWith(
                                  color: context.color.text.secondary,
                                ),
                              ),
                              4.verticalSpace,     
                              Container(
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.color.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "2",
                                    style: context.textStyle.bodySmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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