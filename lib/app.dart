import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route/router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: $appRoutes,
      initialLocation: '/',
      navigatorKey: rootNavigatorKey,
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
