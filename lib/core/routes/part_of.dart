import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../src/module/common/authentication/view/login/login_screen.dart';
import '../../src/module/common/authentication/view_model/user_role_provider.dart';
import '../../src/module/common/bottom_nav_bar/view/bottom_nav_bar.dart';
import '../../src/module/common/messages/view/message_list_screen.dart';
import '../../src/module/common/onborading/view/onboarding_screen.dart';
import '../../src/module/common/splash/view/splash_screen.dart';
import '../../src/module/user/setting/setting_screen.dart';
import '../../src/widgets/wrapper/widget_wrapper.dart';
import '../providers/navigator_key_provider.dart';
import 'custom_transition_page.dart';
import 'route_const.dart';

part 'route_config.dart';
