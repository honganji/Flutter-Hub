import 'package:flutter/material.dart';

import '../../../../config/route/router.dart';
import '../../home/home_route.dart';

class MobileErrorScreen extends StatelessWidget {
  const MobileErrorScreen(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Error Message: $message'),
          GestureDetector(
            onTap: () => const HomeRoute().go(context),
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
