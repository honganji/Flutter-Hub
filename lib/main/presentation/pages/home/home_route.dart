import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/extension/extension_buildcontext.dart';
import 'desktop/desktop_home_screen.dart';
import 'mobile/mobile_home_screen.dart';

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      context.isDesktop ? const DesktopHomeScreen() : const MobileHomeScreen();
}
