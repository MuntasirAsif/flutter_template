import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../module/common/authentication/view_model/user_role_provider.dart';
import '../../module/common/bottom_nav_bar/view/bottom_nav_bar.dart';
import '../../module/service_provider/home/view/booking_history_screen.dart';
import '../../module/user/setting/view/booking_history/booking_history.dart';
import '../../module/service_provider/home/view/provider_home_screen.dart';
import '../../module/user/home/view/user_home_screen.dart';

class HomeScreenWrapper extends ConsumerWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);

    if (role == UserRole.provider) {
      return const ProviderHomeScreen();
    } else if (role == UserRole.user) {
      return const UserHomeScreen();
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class BookingHistoryWrapper extends ConsumerWidget {
  const BookingHistoryWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);

    if (role == UserRole.provider) {
      return const ProviderBookingHistoryScreen();
    } else if (role == UserRole.user) {
      return const BookingHistoryScreen();
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
