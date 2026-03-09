import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/routes/route_const.dart';
import '../../../../../../../core/static/extensions/localization_extension.dart';
import '../../../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../../../core/static/theme/theme.dart';
import '../../../../../../../data/auth/data/model/register_model.dart';
import '../../../../../../widgets/custom_loading_indicator.dart';
import '../../../../../../widgets/custom_toast.dart';
import '../../../view_model/register_view_model.dart';
import '../../../view_model/user_role_provider.dart';

class ServiceProviderForm extends StatelessWidget {
  const ServiceProviderForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    final fromKey = GlobalKey<FormState>();
    return Form(
      key: fromKey,
      child: ListView(
        children: [
          Text(
            context.s.name,
            style: context.textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          5.verticalSpace,
          TextFormField(
            controller: name,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Name is required'),
              FormBuilderValidators.minLength(
                3,
                errorText: 'Name must be at least 3 characters',
              ),
            ]),
            decoration: InputDecoration(
              hintText: context.s.enter_your_name,
              prefixIcon: Container(
                padding: EdgeInsets.all(const Dimensions().padding.p4.r),
                margin: EdgeInsets.all(const Dimensions().padding.p8.r),
                decoration: BoxDecoration(
                  color: context.color.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person_outline, color: context.color.primary),
              ),
            ),
          ),
          12.verticalSpace,

          Text(
            context.s.phone_number,
            style: context.textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          5.verticalSpace,

          TextFormField(
            controller: phone,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Phone number is required',
              ),
              FormBuilderValidators.minLength(
                10,
                errorText: 'Phone number must be at least 10 digits',
              ),
              FormBuilderValidators.maxLength(
                15,
                errorText: 'Phone number must be less than 15 digits',
              ),
            ]),
            decoration: InputDecoration(
              hintText: context.s.enter_your_phone_number,
              prefixIcon: Container(
                padding: EdgeInsets.all(const Dimensions().padding.p4.r),
                margin: EdgeInsets.all(const Dimensions().padding.p8.r),
                decoration: BoxDecoration(
                  color: context.color.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.phone_outlined, color: context.color.primary),
              ),
            ),
          ),
          12.verticalSpace,

          Text(
            context.s.email,
            style: context.textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          5.verticalSpace,

          TextFormField(
            controller: email,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email is required'),
              FormBuilderValidators.email(
                errorText: 'Please enter a valid email address',
              ),
            ]),
            decoration: InputDecoration(
              hintText: context.s.enter_your_email,
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
          12.verticalSpace,

          Text(
            context.s.password,
            style: context.textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          5.verticalSpace,

          TextFormField(
            controller: password,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Password is required'),
              FormBuilderValidators.minLength(
                6,
                errorText: 'Password must be at least 6 characters',
              ),
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
                child: Icon(Icons.lock_outlined, color: context.color.primary),
              ),
            ),
          ),
          12.verticalSpace,

          Text(
            context.s.confirm_password,
            style: context.textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          5.verticalSpace,

          TextFormField(
            controller: confirmPassword,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Confirm password is required',
              ),
              FormBuilderValidators.minLength(
                6,
                errorText: 'Confirm password must be at least 6 characters',
              ),
            ]),
            decoration: InputDecoration(
              hintText: context.s.confirm_your_password,
              prefixIcon: Container(
                padding: EdgeInsets.all(const Dimensions().padding.p4.r),
                margin: EdgeInsets.all(const Dimensions().padding.p8.r),
                decoration: BoxDecoration(
                  color: context.color.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.lock_outlined, color: context.color.primary),
              ),
            ),
          ),
          10.verticalSpace,
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text(
                context.s.agree_with_terms_condition,
                style: context.textStyle.bodyMedium,
              ),
              const Spacer(),
            ],
          ),
          10.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              ref.listen(signUpViewModelProvider, (previous, next) {
                if (next.hasError) {
                  CustomToast.showError(
                    context,
                    title: 'Error',
                    description: next.error.toString(),
                  );
                }

                if (next.hasValue) {
                  CustomToast.showSuccess(
                    context,
                    title: 'Success',
                    description: 'Account created successfully',
                  );
                  context.go(RouteConst.userHomeScreen);
                }
              });

              final state = ref.watch(signUpViewModelProvider);

              return FilledButton(
                child: state.when(
                  data: (_) => Text(context.s.sign_up),
                  loading: () => const CustomLoadingIndicator(),
                  error: (error, stackTrace) => Text(context.s.sign_up),
                ),
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    if (password.text != confirmPassword.text) {
                      CustomToast.showError(
                        context,
                        title: 'Error',
                        description: 'Passwords do not match',
                      );
                      return;
                    }

                    ref
                        .read(signUpViewModelProvider.notifier)
                        .register(
                          RegisterModel(
                            name: name.text,
                            phone: phone.text,
                            email: email.text,
                            password: password.text,
                            role: 'provider',
                          ),
                        );
                    if (state.hasError) {
                      CustomToast.showError(
                        context,
                        title: 'Error',
                        description: state.error.toString(),
                      );
                    } else {
                      ref.read(userRoleProvider.notifier).switchToProvider();
                      CustomToast.showSuccess(
                        context,
                        title: 'Success',
                        description: 'Account created successfully',
                      );
                      context.go(RouteConst.userHomeScreen);
                    }
                  }
                },
              );
            },
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.s.already_have_an_account,
                style: context.textStyle.bodyMedium,
              ),
              GestureDetector(
                onTap: () {
                  context.push(RouteConst.login);
                },
                child: Text(
                  context.s.log_in,
                  style: context.textStyle.bodyMedium.copyWith(
                    color: context.color.primary,
                  ),
                ),
              ),
            ],
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
