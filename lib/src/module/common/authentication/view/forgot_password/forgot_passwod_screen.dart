import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/routes/route_const.dart';
import '../../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../../core/static/theme/theme.dart';
import '../../../../../../data/auth/data/model/send_otp_forget_model.dart';
import '../../../../../widgets/custom_toast.dart';
import '../../view_model/verify_otp_view_model.dart';

class ForgotPasswodScreen extends StatelessWidget {
  const ForgotPasswodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: const Dimensions().padding.p16.w,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: .center,
            children: [
              Text(
                "Forgot Password",
                style: context.textStyle.headingLarge.copyWith(
                  color: context.color.primary,
                ),
              ),
              10.verticalSpace,
              Text(
                "Forgot your password? We’ll help you reset it.",
                textAlign: TextAlign.center,
                style: context.textStyle.bodyMedium.copyWith(
                  color: context.color.primary,
                ),
              ),
              40.verticalSpace,
              Align(
                alignment: .centerLeft,
                child: Text(
                  "Email or phone number",
                  style: context.textStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              10.verticalSpace,
              TextFormField(
                controller: emailController,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                decoration: InputDecoration(
                  hintText: "Enter your email address or phone number",
                  prefixIcon: Container(
                    padding: EdgeInsets.all(const Dimensions().padding.p4.r),
                    margin: EdgeInsets.all(const Dimensions().padding.p8.r),
                    decoration: BoxDecoration(
                      color: context.color.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.email_outlined,
                      color: context.color.primary,
                    ),
                  ),
                ),
              ),

              // Button
              40.verticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  return FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ref
                            .read(sendOtpForgetViewModelProvider.notifier)
                            .sendOtpForget(
                              SendOtpForgetModel(email: emailController.text),
                            );
                        if (ref.read(sendOtpForgetViewModelProvider).hasValue) {
                          context.pushNamed(RouteConst.verification);
                        } else {
                          CustomToast.showError(
                            context,
                            title: "Error",
                            description: ref
                                .read(sendOtpForgetViewModelProvider)
                                .error
                                .toString(),
                          );
                        }
                      }
                    },
                    child: const Text("Reset Password"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
