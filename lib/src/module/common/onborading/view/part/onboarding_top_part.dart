import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/onboarding_model.dart';
import '../../view_model/onboarding_view_model.dart';

import 'language_selection_part.dart';

class OnboardingTopPart extends ConsumerWidget {
  const OnboardingTopPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(onboardingProvider);

    if (pageIndex == 0) {
      return const LanguageSelectionPart();
    }

    final currentPage = OnboardingModel.getPages(context)[pageIndex - 1];
    return Center(
      child: Image.asset(currentPage.image, fit: BoxFit.fitHeight).animate(
        key: ValueKey(pageIndex),
      )..slideX(begin: 1, end: 0, duration: 400.ms, curve: Curves.easeOut),
    );
  }
}
