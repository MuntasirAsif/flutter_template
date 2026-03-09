import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/static/theme/theme.dart';

class CreateOfferBottomSheet extends StatelessWidget {
  const CreateOfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.scaffoldBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: MainAxisSize.min, // ← grows only as needed
          children: [
            Row(
              children: [
                Text(
                  "Service Proposal",
                  style: context.textStyle.headingMedium,
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: context.color.text.primary),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            16.verticalSpace,
            Text("Price", style: context.textStyle.headingSmall),
            8.verticalSpace,
            TextFormField(decoration: const InputDecoration(hintText: "Price")),
            16.verticalSpace,
            Text("Date", style: context.textStyle.headingSmall),
            8.verticalSpace,
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                  initialDate: DateTime.now(),
                );
              },
              child: Container(
                height: 40.h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: context.color.border),
                ),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    "Select Date",
                    style: context.textStyle.bodyMedium.copyWith(
                      color: context.color.text.secondary,
                    ),
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            Text("Time", style: context.textStyle.headingSmall),
            8.verticalSpace,
            GestureDetector(
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now());
              },
              child: Container(
                height: 40.h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: context.color.border),
                ),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    "Select Time",
                    style: context.textStyle.bodyMedium.copyWith(
                      color: context.color.text.secondary,
                    ),
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            Text("Service Details", style: context.textStyle.headingSmall),
            8.verticalSpace,
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(hintText: "Service Details"),
            ),
            20.verticalSpace,
            FilledButton(onPressed: () {}, child: const Text("Submit")),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
