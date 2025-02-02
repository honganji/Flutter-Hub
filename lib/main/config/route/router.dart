import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/layout/desktop/desktop_shell_route_screen.dart';
import '../../presentation/layout/mobile/mobile_shell_route_screen.dart';
import '../../presentation/pages/home/home_route.dart';
import '../../presentation/pages/setting/setting_route.dart';
import '../../presentation/pages/users/sub_sreens/user_route.dart';
import '../../presentation/pages/users/users_route.dart';
import '../extension/extension_buildcontext.dart';

part 'router.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>();

/* 
  新しいルートを加える場合は、まずこのファイルにルートを追加します。
  その後、そのページが位置する場所にディレクトリを設置して、そのディレクトリ内に
  モバイル用とデスクトップ用のファイルを作成してください。
  最後に〇〇_route.dartファイルを作成してルートを作成してください。
 */

@TypedShellRoute<MyShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(
      path: '/',
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SettingRoute>(path: 'setting'),
        TypedGoRoute<UsersRoute>(
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
