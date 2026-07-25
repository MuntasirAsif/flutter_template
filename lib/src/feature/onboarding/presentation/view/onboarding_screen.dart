import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/src/widgets/background_wrapper.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_const.dart';
import '../../../../../core/static/theme/theme.dart';
import '../view_model/onboarding_view_model.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  final List<_OnboardingPage> _pages = const [
    _OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Welcome to CCW Connect',
      description:
          'Your journey to better mental health starts here. Connect with professionals and access resources anytime.',
    ),
    _OnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'Track Your Progress',
      description:
          'Monitor your wellness journey with personalized insights and track your growth over time.',
    ),
    _OnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'Get Started Today',
      description:
          'Join our community and take the first step towards a healthier, happier you.',
    ),
  ];

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
    if (currentPage < _pages.length - 1) {
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
              itemCount: _pages.length,
              onPageChanged: (index) {
                ref.read(onboardingCurrentPageProvider.notifier).state = index;
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(page.image, height: 400.h, fit: BoxFit.contain),
                    SizedBox(height: 40.h),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.color.scaffoldBackground,
                        ),
                        child: Column(
                          children: [
                            Text(
                              page.title,
                              style: context.textStyle.headlineLarge.copyWith(
                                color: context.color.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: context.spacing.s16.h),
                            Text(
                              page.description,
                              style: context.textStyle.bodyMedium.copyWith(
                                color: context.color.text.secondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(context.padding.p24.r),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      _pages.length,
                                      (index) => AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: context.spacing.s4.w,
                                        ),
                                        width: currentPage == index
                                            ? 24.w
                                            : 8.w,
                                        height: 8.h,
                                        decoration: BoxDecoration(
                                          color: currentPage == index
                                              ? context.color.primary
                                              : context.color.disabled,
                                          borderRadius: BorderRadius.circular(
                                            context.radius.r4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: context.spacing.s24.h),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48.h,
                                    child: FilledButton(
                                      onPressed: _onNext,
                                      child: Text(
                                        currentPage == _pages.length - 1
                                            ? 'Get Started'
                                            : 'Next',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage {
  const _OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}
