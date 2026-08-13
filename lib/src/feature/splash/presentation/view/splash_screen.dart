import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/routes/route_const.dart';
import '../../../onboarding/domain/provider/onboarding_repository_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      _navigateBasedOnOnboarding();
    });
  }

  void _navigateBasedOnOnboarding() async {
    if (!mounted) return;

    final onboardingRepository = ref.read(onboardingRepositoryProvider);
    final isOnboardingCompleted = await onboardingRepository
        .isOnboardingCompleted();

    if (!mounted) return;

    if (isOnboardingCompleted) {
      context.go(RouteConst.login);
    } else {
      context.go(RouteConst.onBoarding);
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.splashOnboardingBackground.image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeIn,
              child: Assets.images.appIcon.image(width: 120.w, height: 120.w),
            ),
          ),
        ],
      ),
    );
  }
}
