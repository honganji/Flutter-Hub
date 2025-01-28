import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/extension/extension_buildcontext.dart';
import 'desktop/desktop_error_screen.dart';
import 'mobile/mobile_error_screen.dart';

class ErrorRoute extends GoRouteData {
  const ErrorRoute(this.message);
  final String message;

  @override
  Widget build(BuildContext context, GoRouterState state) => context.isDesktop
      ? DesktopErrorScreen(message)
      : MobileErrorScreen(message);
}
