import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../src/feature/authentication/presentation/view/login/login_screen.dart';
import '../../src/feature/onboarding/presentation/view/onboarding_screen.dart';
import '../../src/feature/splash/presentation/view/splash_screen.dart';

import '../../src/feature/home/presentation/bottom_nav_bar/view/bottom_bav_bar.dart';
import '../providers/navigator_key_provider.dart';
import 'custom_transition_page.dart';
import 'route_const.dart';

part 'route_config.dart';
