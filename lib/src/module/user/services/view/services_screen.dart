import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_const.dart';
import '../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../core/static/theme/theme.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aircon")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: const Dimensions().padding.p16.w,
        ),
        child: Column(
          children: [
            TextFormField(decoration: const InputDecoration(hintText: "Search")),
            20.verticalSpace,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 15.w,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: context.color.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              "https://acservicedhaka.com/wp-content/uploads/2023/01/Ac-repair.jpg",
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(const Dimensions().padding.p8.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "AC Repair",
                                style: context.textStyle.bodyMedium,
                              ),
                              10.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: context.color.primary,
                                        size: 15.r,
                                      ),
                                      Text(
                                        "4.5(20)",
                                        style: context.textStyle.bodySmall,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "₫500/hr",
                                    style: context.textStyle.bodySmall,
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              SizedBox(
                                height: 30.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    log(" More Details");
                                    context.push(RouteConst.providerDetails);
                                  },
                                  child: const Text("More Details"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
