import 'package:flutter/material.dart';
import 'package:vezy/core/gen/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  S get s => S.of(this)!;
}
