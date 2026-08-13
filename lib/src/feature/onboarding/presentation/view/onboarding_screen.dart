import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_const.dart';
import '../../../../../core/static/theme/theme.dart';
import '../../../../widgets/background_wrapper.dart';
import '../view_model/onboarding_view_model.dart';
import 'widgets/onboarding_page_data.dart';
import 'widgets/onboarding_page_item.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    await ref.read(onboardingViewModelProvider.notifier).completeOnboarding();
    if (mounted) {
      context.go(RouteConst.login);
    }
  }

  void _onNext() {
    final currentPage = ref.read(onboardingCurrentPageProvider);
    if (currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _onSkip() {
    _completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(onboardingCurrentPageProvider);

    return BackgroundWrapper(
      useSafeArea: false,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: _onSkip,
              child: Text(
                'Skip',
                style: context.textStyle.bodyMedium.copyWith(
                  color: context.color.primary,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                ref.read(onboardingCurrentPageProvider.notifier).state = index;
              },
              itemBuilder: (context, index) {
                final page = onboardingPages[index];
                return OnboardingPageItem(
                  page: page,
                  isActive: currentPage == index,
                  totalPages: onboardingPages.length,
                  onNext: _onNext,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
