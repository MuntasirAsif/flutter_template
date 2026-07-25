import '../../../../../core/service/cache/cache_service.dart';
import '../../domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final CacheService _cacheService;

  OnboardingRepositoryImpl(this._cacheService);

  @override
  Future<bool> isOnboardingCompleted() async {
    final result = _cacheService.get<bool>(CacheKey.isOnBoardingCompleted);
    return result ?? false;
  }

  @override
  Future<void> completeOnboarding() async {
    await _cacheService.save(CacheKey.isOnBoardingCompleted, false);
  }
}
