import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../go_router_builder/ui/shell_route/sub_screens/users/mobile/mobile_users_screen.dart';
import '../../../config/extension/extension_buildcontext.dart';
import 'desktop/desktop_user_screen.dart';

class UsersRoute extends GoRouteData {
  const UsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      context.isDesktop ? const DesktopUserScreen() : const MobileUsersScreen();
}
