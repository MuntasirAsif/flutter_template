import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/service/cache/cache_service.dart';
import '../../data/repository/onboarding_repository_impl.dart';
import '../repository/onboarding_repository.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final cacheService = ref.watch(cacheServiceProvider);
  return OnboardingRepositoryImpl(cacheService);
});
