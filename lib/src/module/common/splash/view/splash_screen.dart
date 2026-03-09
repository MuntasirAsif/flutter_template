import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vezy/core/routes/route_const.dart';
import 'package:vezy/core/service/cache/cache_service.dart';
import 'package:vezy/core/static/theme/theme.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    // Navigate after 2.5 seconds total
    Timer(const Duration(milliseconds: 2500), _checkCachingAndNavigate);
  }

  void _checkCachingAndNavigate() {
    if (!mounted) return;

    final cacheService = ref.read(cacheServiceProvider);

    final isOnBoardingCompleted =
        cacheService.get<bool>(CacheKey.isOnBoardingCompleted) ?? false;

    final isLoggedIn = cacheService.get<bool>(CacheKey.isLoggedIn) ?? false;

    if (!isOnBoardingCompleted) {
      context.go(RouteConst.onBoarding);
      cacheService.save(CacheKey.isOnBoardingCompleted, true);
    } else if (isLoggedIn) {
      context.go(RouteConst.userHomeScreen);
    } else {
      context.go(RouteConst.login);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo-full.png',
                  width: 200.w,
                  fit: BoxFit.contain,
                ),
                20.verticalSpace,
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.color.primary,
                  ),
                  strokeWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
