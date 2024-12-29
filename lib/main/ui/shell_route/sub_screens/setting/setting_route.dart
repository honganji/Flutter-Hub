import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../extension/extension_buildcontext.dart';
import 'desktop/desktop_setting_screen.dart';
import 'mobile/mobile_setting_screen.dart';

class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => context.isDesktop
      ? const DesktopSettingScreen()
      : const MobileSettingScreen();
}
