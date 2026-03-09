import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../model/onboarding_model.dart';

class OnboardingViewModel extends StateNotifier<int> {
  OnboardingViewModel() : super(0);

  void setCurrentPage(int page) {
    state = page;
  }

  OnboardingModel getCurrentPageModel(BuildContext context) {
    final pages = OnboardingModel.getPages(context);
    return pages[state];
  }
}

final onboardingProvider = StateNotifierProvider<OnboardingViewModel, int>((
  ref,
) {
  return OnboardingViewModel();
});
