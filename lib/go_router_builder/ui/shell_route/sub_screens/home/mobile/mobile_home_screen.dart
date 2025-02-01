import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('mobile Home'),
          ElevatedButton(
            onPressed: () => context.go('/errrrr'),
            child: const Text('Error happens'),
          ),
        ],
      ),
    );
  }
}
