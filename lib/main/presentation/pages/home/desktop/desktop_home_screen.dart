import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Desktop Home'),
          ElevatedButton(
            onPressed: () => context.go('/errrrr'),
            child: const Text('Error happens'),
          ),
        ],
      ),
    );
  }
}
