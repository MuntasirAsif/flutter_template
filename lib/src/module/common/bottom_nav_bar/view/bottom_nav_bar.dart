import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vezy/core/static/const/app_icons.dart';
import 'package:vezy/core/static/theme/theme.dart';

import 'package:go_router/go_router.dart';

enum UserRole{ user, provider}


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.navigationShell , required this.role,});

  final StatefulNavigationShell navigationShell;
    final UserRole role;


  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = context.isTablet;

    return Scaffold(
      body: Row(
        children: [
          if (isTablet)
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: _goBranch,
              labelType: NavigationRailLabelType.none,
              backgroundColor: Colors.white,
              indicatorColor: context.color.primary,
              destinations: [
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    AppIcons.home,
                    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                  selectedIcon: SvgPicture.asset(
                    AppIcons.home,
                    colorFilter: ColorFilter.mode(context.color.scaffoldBackground, BlendMode.srcIn),
                  ),
                  label: const Text('Home'),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    AppIcons.message,
                    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                  selectedIcon: SvgPicture.asset(
                    AppIcons.message,
                    colorFilter: ColorFilter.mode(context.color.scaffoldBackground, BlendMode.srcIn),
                  ),
                  label: const Text('Message'),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    AppIcons.bookings,
                    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                  selectedIcon: SvgPicture.asset(
                    AppIcons.bookings,
                    colorFilter: ColorFilter.mode(context.color.scaffoldBackground, BlendMode.srcIn),
                  ),
                  label: const Text('Bookings'),
                ),
                NavigationRailDestination(
                  icon: SvgPicture.asset(
                    AppIcons.settings,
                    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                  selectedIcon: SvgPicture.asset(
                    AppIcons.settings,
                    colorFilter: ColorFilter.mode(context.color.scaffoldBackground, BlendMode.srcIn),
                  ),
                  label: const Text('Settings'),
                ),
              ],
            ),
          Expanded(child: navigationShell),
        ],
      ),
      bottomNavigationBar: isTablet
          ? null
          : Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TabIcon(
                    iconPath: AppIcons.home,
                    isSelected: navigationShell.currentIndex == 0,
                    onTap: () => _goBranch(0),
                  ),
                  TabIcon(
                    iconPath: AppIcons.message,
                    isSelected: navigationShell.currentIndex == 1,
                    onTap: () => _goBranch(1),
                  ),
                  TabIcon(
                    iconPath: AppIcons.bookings,
                    isSelected: navigationShell.currentIndex == 2,
                    onTap: () => _goBranch(2),
                  ),
                  TabIcon(
                    iconPath: AppIcons.settings,
                    isSelected: navigationShell.currentIndex == 3,
                    onTap: () => _goBranch(3),
                  ),
                ],
              ),
            ),
    );
  }
}

class TabIcon extends StatelessWidget {
  const TabIcon({
    super.key,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isSelected ? context.color.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            isSelected ? context.color.scaffoldBackground : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
