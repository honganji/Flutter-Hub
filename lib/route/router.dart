import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.dart';
import '../extension/extension_buildcontext.dart';
import '../ui/error/desktop/desktop_error_screen.dart';
import '../ui/error/mobile/mobile_error_screen.dart';
import '../ui/home/desktop/desktop_home_screen.dart';
import '../ui/home/mobile/mobile_home_screen.dart';
import '../ui/setting/desktop/desktop_setting_screen.dart';
import '../ui/setting/mobile/mobile_setting_screen.dart';
import '../ui/shell_route/desktop/desktop_shell_route_screen.dart';
import '../ui/shell_route/mobile/mobile_shell_route_screen.dart';
import '../ui/user/desktop/components/desktop_user_dialog.dart';
import '../ui/user/desktop/desktop_user_screen.dart';
import '../ui/user/mobile/components/mobile_user_dialog.dart';

part 'router.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<MyShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(
      path: '/',
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SettingRoute>(path: 'setting'),
        TypedGoRoute<UsersRouteData>(
          path: 'users',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<UserRouteData>(path: ':id'),
          ],
        ),
      ],
    ),
  ],
)
class MyShellRoute extends ShellRouteData {
  const MyShellRoute();

  static final $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      context.isDesktop
          ? DesktopShellRouteScreen(navigator)
          : MobileShellRouteScreen(navigator);
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      context.isDesktop ? const DesktopHomeScreen() : const MobileHomeScreen();
}

class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => context.isDesktop
      ? const DesktopSettingScreen()
      : const MobileSettingScreen();
}

class UsersRouteData extends GoRouteData {
  const UsersRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) => context.isDesktop
      ? const DesktopUserScreen()
      : const MobileSettingScreen();
}

class UserRouteData extends GoRouteData {
  const UserRouteData(this.name, {required this.id});
  final String? name;
  final int id;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      context.isDesktop
          ? DesktopUserDialog(id, key: state.pageKey)
          : MobileUserDialog(id);
}

class ErrorRouteData extends GoRouteData {
  const ErrorRouteData(this.message);
  final String message;

  @override
  Widget build(BuildContext context, GoRouterState state) => context.isDesktop
      ? DesktopErrorScreen(message)
      : MobileErrorScreen(message);
}
