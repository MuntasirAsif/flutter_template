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
        builder: (context, state) => const SettingScreen(),
      ),
    ],
  ),
];
