import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route/router.dart';
import 'ui/shell_route/sub_screens/error/error_route_data.dart';

/* 
  rootからnavigatorをコントロールするためのkey
  たとえばDialogにこのkeyを設定すればナビゲータにもoverlayが適応される
 */
final rootNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: $appRoutes,
      initialLocation: '/',
      navigatorKey: rootNavigatorKey,
      errorBuilder: (context, state) {
        return ErrorRoute(state.error.toString()).build(context, state);
      },
    );
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
