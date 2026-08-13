import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/static/theme/theme.dart';
import 'widgets/exit_confirm_dialog.dart';
import 'widgets/nav_item.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  Future<void> _onBackPressed() async {
    final shouldExit = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (context) => const ExitConfirmDialog(),
    );

    if (shouldExit == true) {
      SystemNavigator.pop();
    }
  }

  void _onTabChanged(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  NavigationDestination _navItem(
    int index,
    String asset,
    String label,
    ColorScheme color,
    int currentIndex,
  ) {
    final isSelected = currentIndex == index;

    return NavigationDestination(
      icon: NavItem(
        key: ValueKey(index),
        asset: asset,
        label: label,
        isSelected: isSelected,
        color: color.onSurface.withValues(alpha: 0.5),
        shouldShake: false,
      ),
      selectedIcon: NavItem(
        key: ValueKey("selected_$index"),
        asset: asset,
        label: label,
        isSelected: true,
        color: color.primary,
        shouldShake: true,
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final currentIndex = widget.navigationShell.currentIndex;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop) await _onBackPressed();
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          child: NavigationBar(
            backgroundColor: context.color.onPrimary,
            selectedIndex: currentIndex,
            height: 60.h,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: _onTabChanged,
            indicatorColor: context.color.primary.withValues(alpha: 0.1),
            destinations: [
              _navItem(0, Assets.icons.home, 'Home', color, currentIndex),
              _navItem(1, Assets.icons.task, 'Habit', color, currentIndex),
              _navItem(2, Assets.icons.book, 'Study', color, currentIndex),
              _navItem(
                3,
                Assets.icons.userGroup,
                'Community',
                color,
                currentIndex,
              ),
              _navItem(4, Assets.icons.user, 'Profile', color, currentIndex),
            ],
          ),
        ),
      ),
    );
  }
}
