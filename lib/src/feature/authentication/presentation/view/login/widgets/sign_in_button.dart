import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../widgets/custom_loading_indicator.dart';
import '../../../view_model/login_view_model.dart';

class SignInButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const SignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);

    return SizedBox(
      height: 48.h,
      child: FilledButton(
        onPressed: onPressed,
        child: state.when(
          data: (data) => Text('Sign In'),
          loading: () => const CustomLoadingIndicator(),
          error: (Object error, StackTrace stackTrace) => Text('Sign In'),
        ),
      ),
    );
  }
}
