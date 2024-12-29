import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app.dart';
import '../../../../../extension/extension_buildcontext.dart';
import 'user/desktop/desktop_user_screen.dart';
import 'user/mobile/mobile_user_screen.dart';

class UserRoute extends GoRouteData {
  const UserRoute(this.name, {required this.id});
  final String? name;
  final int id;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      context.isDesktop
          ? DesktopUserScreen(id, name, key: state.pageKey)
          : MobileUserScreen(id, key: state.pageKey);
}
