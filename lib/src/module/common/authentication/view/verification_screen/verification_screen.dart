import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

import '../../../../../../core/routes/route_const.dart';
import '../../../../../../core/static/theme/theme.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final smartAuth = SmartAuth.instance; // ✅ FIXED
  final pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  Future<void> _startListening() async {
    final res = await smartAuth.getSmsWithUserConsentApi();

    final code = res.data?.code;

    if (code != null) {
      pinController.text = code;
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600.w),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.padding.p16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Verification Screen",
                  style: context.textStyle.headingLarge.copyWith(
                    color: context.color.primary,
                  ),
                ),
                Text(
                  "We’ve sent a verification code to your email a*@gmail.com. Please enter it below.",
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodyMedium,
                ),
                16.verticalSpace,
                Text("Enter your OTP", style: context.textStyle.headingSmall),
                10.verticalSpace,

                /// ✅ Autofill works via SmartAuth controller
                Pinput(
                  controller: pinController,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: context.textStyle.bodyLarge.copyWith(
                      color: context.color.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.color.primary.withValues(alpha: 0.5),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),

                16.verticalSpace,
                24.verticalSpace,

                Text(
                  "Code expires in 59 sec",
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodyMedium,
                ),

                16.verticalSpace,

                FilledButton(
                  onPressed: () {
                    context.push(RouteConst.resetPassword);
                  },
                  child: Text("Submit", style: context.textStyle.bodyMedium),
                ),

                50.verticalSpace,
                RichText(
                  text: TextSpan(
                    text: "You have not received the email?",
                    style: context.textStyle.bodyMedium.copyWith(
                      color: context.color.text.primary,
                    ),
                    children: [
                      TextSpan(
                        text: " Resend",
                        style: context.textStyle.bodyMedium.copyWith(
                          color: context.color.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: context.color.primary,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
