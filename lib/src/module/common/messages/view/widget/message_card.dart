import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezy/core/static/theme/src/theme_extensions/src/dimensions.dart';

import '../../../../../../core/static/theme/theme.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.isMe, required this.message});

  final bool isMe;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: const Dimensions().padding.p8),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Container(
              constraints: BoxConstraints(maxWidth: 0.75.sw),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(isMe ? 16.r : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 16.r),
                ),
                border: Border.all(color: context.color.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message),
                  4.verticalSpace,
                  Align(
                    alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                    child: Text(
                      '10:00 AM',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
