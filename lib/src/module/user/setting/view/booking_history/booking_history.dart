import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/static/extensions/localization_extension.dart';
import '../../../../common/authentication/view_model/user_role_provider.dart';
import '../../../../common/bottom_nav_bar/view/bottom_nav_bar.dart';

class BookingHistoryScreen extends ConsumerWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRole = ref.watch(userRoleProvider);
    return Scaffold();
  }
}
