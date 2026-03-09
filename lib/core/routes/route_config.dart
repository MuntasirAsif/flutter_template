part of 'part_of.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RouteConst.splash,
    routes: <RouteBase>[
      GoRoute(
        path: RouteConst.splash,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const SplashScreen(),
          key: state.pageKey,
          type: AppTransitionType.fade,
        ),
      ),
      GoRoute(
        path: RouteConst.onBoarding,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const OnboardingScreen(),
          key: state.pageKey,
          type: AppTransitionType.fade,
        ),
      ),
      GoRoute(
        path: RouteConst.login,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const LoginScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Consumer(
            builder: (context, ref, _) {
              final role = ref.watch(userRoleProvider) ?? UserRole.user;

              return BottomNavBar(
                key: GlobalObjectKey('bottom-nav-${state.hashCode}'),
                navigationShell: navigationShell,
                role: role,
              );
            },
          );
        },
        branches: bottomBranches,
      ),
      GoRoute(
        path: RouteConst.forgotPassword,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ForgotPasswodScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.verification,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const VerificationScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.resetPassword,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ResetPasswordScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.signUp,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const SignUpScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.userPersonalDetails,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const PersonalDetailsScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.userMyAddress,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const MyAddressesScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.userAddNewAddress,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const AddNewAddressScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.userBookingHistory,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const BookingHistoryScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.userBookingHistoryDetails,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const BookingHistoryDetailsScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.changePassword,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ChangePasswordScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.language,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const LanguageScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.aboutUs,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const AboutUsScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.termsCondition,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const TermsConditionScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.privacyPolicy,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const PrivacyPolicyScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.conversation,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ConversationScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.userServiceCategory,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ServiceCategoryScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.serviceSubCategory,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const SubCategoriesScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.service,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ServicesScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerDetails,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ProviderDetailsScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.serviceDetails,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ServiceDetailsScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),

      GoRoute(
        path: RouteConst.ivoice,
        pageBuilder: (context, state) => buildTransitionPage(
          child: InvoiceScreen(isCompleted: (state.extra as bool?) ?? false),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerPersonalDetails,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ProviderPersonalDetailsScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerMyService,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const MyServiceScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerAddService,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const AddServiceScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerEarning,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const EarningScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerWithdraw,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const WithdrawScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerBookingHistory,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ProviderBookingHistoryScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.userAddReview,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ReviewScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.notifications,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const NotificationScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.faceId,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const FaceIdScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.serviceCategoryType,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ServiceCategoryTypeScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
      GoRoute(
        path: RouteConst.providerReviews,
        pageBuilder: (context, state) => buildTransitionPage(
          child: const ProviderReviewsScreen(),
          key: state.pageKey,
          type: AppTransitionType.rightToLeft,
        ),
      ),
    ],
  );
});

List<StatefulShellBranch> bottomBranches = [
  // HOME
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: RouteConst.userHomeScreen,
        builder: (context, state) => const HomeScreenWrapper(),
      ),
    ],
  ),

  // MESSAGE
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: RouteConst.userMessage,
        builder: (context, state) => const MessageListScreen(),
      ),
    ],
  ),

  // BOOKING
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: RouteConst.userBooking,
        builder: (context, state) => const BookingHistoryWrapper(),
      ),
    ],
  ),

  // SETTINGS
  StatefulShellBranch(
    routes: [
      GoRoute(
        path: RouteConst.userSettings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  ),
];
