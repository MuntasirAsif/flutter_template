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

class UserForm extends ConsumerStatefulWidget {
  const UserForm({super.key});

  @override
  ConsumerState<UserForm> createState() => _UserFormState();
}

class _UserFormState extends ConsumerState<UserForm> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  bool _termsAccepted = true;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            controller: nameController,
            validator: FormBuilderValidators.required(
              errorText: 'Name is required',
            ),
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
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Phone number is required'),
              FormBuilderValidators.minLength(10, errorText: 'Must be at least 10 digits'),
              FormBuilderValidators.maxLength(15, errorText: 'Must be less than 15 digits'),
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
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email is required'),
              FormBuilderValidators.email(errorText: 'Please enter a valid email address'),
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
            controller: passwordController,
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Password is required'),
              FormBuilderValidators.minLength(6, errorText: 'Password must be at least 6 characters'),
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
            controller: confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
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
              Checkbox(
                value: _termsAccepted, 
                onChanged: (value) {
                  setState(() {
                    _termsAccepted = value ?? false;
                  });
                }
              ),
              Text(
                context.s.agree_with_terms_condition,
                style: context.textStyle.bodyMedium,
              ),
              const Spacer(),
            ],
          ),
          10.verticalSpace,
          FilledButton(
            child: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(signUpViewModelProvider);
                return state.when(
                  data: (_) => Text(context.s.sign_up),
                  loading: () => const CustomLoadingIndicator(),
                  error: (error, stack) => Text(context.s.sign_up),
                );
              },
            ),
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              
              if (!_termsAccepted) {
                CustomToast.showError(
                  context, 
                  title: 'Warning', 
                  description: 'You must agree to the terms and conditions',
                );
                return;
              }

              final viewModel = ref.read(signUpViewModelProvider.notifier);
              await viewModel.register(
                RegisterModel(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  phone: phoneController.text.trim(),
                  password: passwordController.text,
                  role: 'user', // Set default role if needed
                ),
              );

              if (!context.mounted) return;

              final state = ref.read(signUpViewModelProvider);
              ref.read(userRoleProvider.notifier).switchToUser();
              if (state.hasError) {
                CustomToast.showError(
                  context,
                  title: 'Error',
                  description: state.error.toString(),
                );
              } else {
                CustomToast.showSuccess(
                  context,
                  title: 'Success',
                  description: 'Account created successfully!',
                );
                context.push(RouteConst.userHomeScreen);
              }
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

