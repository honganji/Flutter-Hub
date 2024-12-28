import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extension/extension_buildcontext.dart';
import '../ui/about_us/desktop/desktop_about_us_screen.dart';
import '../ui/about_us/mobile/mobile_about_us_screen.dart';
import '../ui/home/desktop/desktop_home_screen.dart';
import '../ui/home/mobile/mobile_home_screen.dart';
import '../ui/setting/desktop/desktop_setting_screen.dart';
import '../ui/setting/mobile/mobile_setting_screen.dart';
import '../ui/shell_route/desktop/desktop_shell_route_screen.dart';
import '../ui/shell_route/mobile/mobile_shell_route_screen.dart';

part 'router.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<MyShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(
      path: '/',
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AboutUsRoute>(path: 'about-us'),
        TypedGoRoute<SettingRoute>(path: 'setting'),
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

class AboutUsRoute extends GoRouteData {
  const AboutUsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => context.isDesktop
      ? const DesktopAboutUsScreen()
      : const MobileAboutUsScreen();
}

class SettingRoute extends GoRouteData {
  const SettingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => context.isDesktop
      ? const DesktopSettingScreen()
      : const MobileSettingScreen();
}
