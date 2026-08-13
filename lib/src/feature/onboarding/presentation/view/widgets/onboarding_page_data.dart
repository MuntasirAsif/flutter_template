class OnboardingPageData {
  final String image;
  final String title;
  final String description;

  const OnboardingPageData({
    required this.image,
    required this.title,
    required this.description,
  });
}

const List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    image: 'assets/images/onboarding1.png',
    title: 'Welcome to CCW Connect',
    description:
        'Your journey to better mental health starts here. Connect with professionals and access resources anytime.',
  ),
  OnboardingPageData(
    image: 'assets/images/onboarding2.png',
    title: 'Track Your Progress',
    description:
        'Monitor your wellness journey with personalized insights and track your growth over time.',
  ),
  OnboardingPageData(
    image: 'assets/images/onboarding3.png',
    title: 'Get Started Today',
    description:
        'Join our community and take the first step towards a healthier, happier you.',
  ),
];
