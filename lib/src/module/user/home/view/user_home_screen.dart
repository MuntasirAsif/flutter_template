import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vezy/core/static/const/app_icons.dart';
import 'package:vezy/core/routes/route_const.dart';
import 'package:vezy/core/static/theme/theme.dart';
import 'package:vezy/core/gen/assets.gen.dart';
import 'package:vezy/core/gen/l10n/app_localizations.dart';
import 'package:vezy/core/static/theme/src/theme_extensions/extensions.dart';
import 'package:vezy/src/module/user/home/view/part/customer_feedback.dart';
import 'package:vezy/src/widgets/service_card.dart';

import '../../../../../core/gen/assets.gen.dart';
import 'part/service_and_category.dart';
import 'part/why_us_part.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  double _currentPos = 0;
  final List<String> _bannerList = [
    Assets.images.demoImage1.path,
    Assets.images.demoImage1.path,
    Assets.images.demoImage1.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
