import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/cart/cart_page.dart';
import '../ui/favorite/favorite_page.dart';
import '../ui/home/home_page.dart';
import '../ui/profile/profile_page.dart';
import '../ui/shell/app_nav_bar.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final likeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'like');
final cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');
final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return AppNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const HomePage(),
              ),
              routes: [
                GoRoute(
                  path: '/detail',
                  parentNavigatorKey: rootNavigatorKey,
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const FavoritePage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: likeNavigatorKey,
          routes: [
            GoRoute(
              path: '/favorite',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const FavoritePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: cartNavigatorKey,
          routes: [
            GoRoute(
              path: '/cart',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const CartPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: profileNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const ProfilePage(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
