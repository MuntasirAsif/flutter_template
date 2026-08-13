import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/provider/onboarding_repository_provider.dart';
import '../../domain/repository/onboarding_repository.dart';

class OnboardingViewModel extends StateNotifier<AsyncValue<void>> {
  final OnboardingRepository _onboardingRepository;

  OnboardingViewModel(this._onboardingRepository)
    : super(const AsyncValue.data(null));

  Future<void> completeOnboarding() async {
    state = const AsyncValue.loading();

    try {
      await _onboardingRepository.completeOnboarding();
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<bool> isOnboardingCompleted() async {
    return await _onboardingRepository.isOnboardingCompleted();
  }
}

final onboardingViewModelProvider =
    StateNotifierProvider<OnboardingViewModel, AsyncValue<void>>((ref) {
      final onboardingRepository = ref.watch(onboardingRepositoryProvider);
      return OnboardingViewModel(onboardingRepository);
    });

final onboardingCurrentPageProvider = StateProvider<int>((ref) => 0);
