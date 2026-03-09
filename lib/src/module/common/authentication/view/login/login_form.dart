import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routes/route_const.dart';
import '../../../../../../core/static/extensions/localization_extension.dart';
import '../../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../../core/static/theme/theme.dart';
import '../../../../../../data/auth/data/model/login_model.dart';
import '../../../../../widgets/custom_loading_indicator.dart';
import '../../../../../widgets/custom_toast.dart';
import '../../view_model/login_view_model.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.s.email_or_phone_number,
            style: context.textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
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
              hintText: context.s.enter_your_email_or_phone_number,
              prefixIcon: Container(
                padding: EdgeInsets.all(const Dimensions().padding.p4.r),
                margin: EdgeInsets.all(const Dimensions().padding.p8.r),
                decoration: BoxDecoration(
                  color: context.color.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.email_outlined, color: context.color.primary),
              ),
            ),
          ),
          16.verticalSpace,
          Text(
            context.s.password,
            style: context.textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          10.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              final obscureText = ref.watch(loginObscurePasswordProvider);
              return TextFormField(
                controller: passwordController,
                obscureText: obscureText,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
                decoration: InputDecoration(
                  hintText: context.s.enter_your_password,
                  prefixIcon: Container(
                    padding: EdgeInsets.all(const Dimensions().padding.p4.r),
                    margin: EdgeInsets.all(const Dimensions().padding.p8.r),
                    decoration: BoxDecoration(
                      color: context.color.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_outline,
                      color: context.color.primary,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: context.color.primary,
                    ),
                    onPressed: () {
                      ref.read(loginObscurePasswordProvider.notifier).state =
                          !obscureText;
                    },
                  ),
                ),
              );
            },
          ),
          5.verticalSpace,
          Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return Checkbox(
                    value: ref.watch(loginRememberMeProvider),
                    onChanged: (value) {
                      ref.read(loginRememberMeProvider.notifier).state =
                          value ?? false;
                    },
                  );
                },
              ),
              Text(context.s.remember_me, style: context.textStyle.bodyMedium),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.push(RouteConst.forgotPassword);
                },
                child: Text(
                  context.s.forgot_password,
                  style: context.textStyle.bodyMedium.copyWith(
                    color: context.color.primary,
                  ),
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(loginViewModelProvider);
              return SizedBox(
                height: 48.h,
                child: FilledButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await ref
                          .read(loginViewModelProvider.notifier)
                          .login(
                            LoginModel(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                            ),
                            rememberMe: ref.read(loginRememberMeProvider),
                          );

                      if (!context.mounted) return;

                      final loginState = ref.read(loginViewModelProvider);
                      if (loginState.hasError) {
                        CustomToast.showError(
                          context,
                          title: 'Error',
                          description: loginState.error.toString(),
                        );
                      } else {
                        CustomToast.showSuccess(
                          context,
                          title: 'Success',
                          description: 'Login successfully!',
                        );
                        
context.push(RouteConst.userHomeScreen);
                      }
                    }
                  },
                  child: state.when(
                    data: (data) {
                      return Text(context.s.sign_in);
                    },
                    loading: () {
                      return const CustomLoadingIndicator();
                    },
                    error: (Object error, StackTrace stackTrace) {
                      return Text(context.s.sign_in);
                    },
                  ),
                ),
              );
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
