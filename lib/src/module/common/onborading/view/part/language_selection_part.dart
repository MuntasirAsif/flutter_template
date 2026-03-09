import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vezy/core/static/extensions/localization_extension.dart';
import 'package:vezy/core/static/theme/theme.dart';

import '../../../../../../core/providers/language_provider.dart';

class LanguageSelectionPart extends ConsumerWidget {
  const LanguageSelectionPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);
    final notifier = ref.read(languageProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLanguageOption(
          context,
          title: context.s.english,
          locale: const Locale('en'),
          currentLocale: currentLocale,
          onChanged: (locale) => notifier.changeLanguage(locale!),
        ),
        16.verticalSpace,
        _buildLanguageOption(
          context,
          title: context.s.vietnamese,
          locale: const Locale('vi'),
          currentLocale: currentLocale,
          onChanged: (locale) => notifier.changeLanguage(locale!),
        ),
      ],
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String title,
    required Locale locale,
    required Locale currentLocale,
    required ValueChanged<Locale?> onChanged,
  }) {
    final isSelected = currentLocale.languageCode == locale.languageCode;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? context.color.primary.withValues(alpha: 0.1)
            : context.color.scaffoldBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isSelected ? context.color.primary : context.color.border,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: RadioListTile<Locale>(
        value: locale,
        groupValue: currentLocale,
        onChanged: onChanged,
        title: Text(
          title,
          style: context.textStyle.bodyLarge.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? context.color.primary : null,
          ),
        ),
        activeColor: context.color.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
