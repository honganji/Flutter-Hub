import 'package:flutter/material.dart';

import '../../../../../route/router.dart';
import '../../home/home_route.dart';

class DesktopErrorScreen extends StatelessWidget {
  const DesktopErrorScreen(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error Message: $message'),
            ElevatedButton(
              onPressed: () => const HomeRoute().go(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
