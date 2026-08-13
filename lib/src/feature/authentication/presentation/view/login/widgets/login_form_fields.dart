import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../../../core/static/theme/theme.dart';
import '../../../../../../widgets/app_text_field.dart';
import '../../../view_model/login_view_model.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email or Phone Number',
          style: context.textStyle.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        10.verticalSpace,
        TextFormField(
          controller: controller,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
          decoration: InputDecoration(
            hintText: 'Enter your email or phone number',
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
      ],
    );
  }
}

class PasswordField extends ConsumerWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(loginObscurePasswordProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: context.textStyle.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        10.verticalSpace,
        AppTextField(
          prefixIcon: Container(
            padding: EdgeInsets.all(const Dimensions().padding.p4.r),
            margin: EdgeInsets.all(const Dimensions().padding.p8.r),
            decoration: BoxDecoration(
              color: context.color.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.lock_outlined, color: context.color.primary),
          ),
          controller: controller,
          obscureText: obscureText,
          hintText: 'Enter your password',
          enableToggleObscure: true,
          obscureIcon: const Icon(Icons.visibility_off),
          obscureIconOff: const Icon(Icons.visibility),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(6),
          ]),
        ),
      ],
    );
  }
}
