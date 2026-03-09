import 'package:flutter/material.dart';
import '../../../../../core/static/const/app_images.dart';
import '../../../../../core/static/extensions/localization_extension.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboardingModel> getPages(BuildContext context) {
    return [
      OnboardingModel(
        image: AppImages.onBoardingImage1,
        title: context.s.effortless_home_maintenance_at_your_fingertips,
        description: context
            .s
            .find_top_rated_professionals_for_servicing_cleaning_electrical_work,
      ),
      OnboardingModel(
        image: AppImages.onBoardingImage2,
        title: context.s.top_quality_home_services_at_the_best_price,
        description: context
            .s
            .reliable_affordable_and_professional_get_the_best_service_without_breaking_the_bank,
      ),
    ];
  }
}
