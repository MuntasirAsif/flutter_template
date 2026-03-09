// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/core
  $LibCoreGen get core => const $LibCoreGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bell.svg
  String get bell => 'assets/icons/bell.svg';

  /// File path: assets/icons/booking_icon.svg
  String get bookingIcon => 'assets/icons/booking_icon.svg';

  /// File path: assets/icons/home_icon.svg
  String get homeIcon => 'assets/icons/home_icon.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/message_filled.svg
  String get messageFilled => 'assets/icons/message_filled.svg';

  /// File path: assets/icons/message_icon.svg
  String get messageIcon => 'assets/icons/message_icon.svg';

  /// File path: assets/icons/person_clock.svg
  String get personClock => 'assets/icons/person_clock.svg';

  /// File path: assets/icons/send.svg
  String get send => 'assets/icons/send.svg';

  /// File path: assets/icons/settings_icon.svg
  String get settingsIcon => 'assets/icons/settings_icon.svg';

  /// List of all assets
  List<String> get values => [
    bell,
    bookingIcon,
    homeIcon,
    location,
    messageFilled,
    messageIcon,
    personClock,
    send,
    settingsIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/demo_image1.png
  AssetGenImage get demoImage1 =>
      const AssetGenImage('assets/images/demo_image1.png');

  /// File path: assets/images/google_logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/images/google_logo.png');

  /// File path: assets/images/logo-full.png
  AssetGenImage get logoFull =>
      const AssetGenImage('assets/images/logo-full.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/onboarding_image_1.png
  AssetGenImage get onboardingImage1 =>
      const AssetGenImage('assets/images/onboarding_image_1.png');

  /// File path: assets/images/onboarding_image_2.png
  AssetGenImage get onboardingImage2 =>
      const AssetGenImage('assets/images/onboarding_image_2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    demoImage1,
    googleLogo,
    logoFull,
    logo,
    onboardingImage1,
    onboardingImage2,
  ];
}

class $LibCoreGen {
  const $LibCoreGen();

  /// Directory path: lib/core/gen
  $LibCoreGenGen get gen => const $LibCoreGenGen();
}

class $LibCoreGenGen {
  const $LibCoreGenGen();

  /// Directory path: lib/core/gen/l10n
  $LibCoreGenL10nGen get l10n => const $LibCoreGenL10nGen();
}

class $LibCoreGenL10nGen {
  const $LibCoreGenL10nGen();

  /// File path: lib/core/gen/l10n/app_en.arb
  String get appEn => 'lib/core/gen/l10n/app_en.arb';

  /// File path: lib/core/gen/l10n/app_localizations.dart
  String get appLocalizations => 'lib/core/gen/l10n/app_localizations.dart';

  /// File path: lib/core/gen/l10n/app_localizations_en.dart
  String get appLocalizationsEn =>
      'lib/core/gen/l10n/app_localizations_en.dart';

  /// File path: lib/core/gen/l10n/app_localizations_vi.dart
  String get appLocalizationsVi =>
      'lib/core/gen/l10n/app_localizations_vi.dart';

  /// File path: lib/core/gen/l10n/app_vi.arb
  String get appVi => 'lib/core/gen/l10n/app_vi.arb';

  /// List of all assets
  List<String> get values => [
    appEn,
    appLocalizations,
    appLocalizationsEn,
    appLocalizationsVi,
    appVi,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
