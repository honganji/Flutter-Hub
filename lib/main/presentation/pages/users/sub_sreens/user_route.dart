import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app.dart';
import '../../../../config/extension/extension_buildcontext.dart';
import 'desktop/desktop_user_screen.dart';
import 'mobile/mobile_user_screen.dart';

class UserRouteData extends GoRouteData {
  const UserRouteData(this.name, {required this.id});
  final String? name;
  final int id;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      context.isDesktop
          ? DesktopUserScreen(id, key: state.pageKey)
          : MobileUserScreen(id);
}
