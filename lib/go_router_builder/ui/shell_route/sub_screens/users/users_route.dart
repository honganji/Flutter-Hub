import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../extension/extension_buildcontext.dart';
import 'desktop/desktop_users_screen.dart';
import 'mobile/mobile_users_screen.dart';

class UsersRoute extends GoRouteData {
  const UsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      context.isDesktop ? const DesktopUserScreen() : const MobileUsersScreen();
}
