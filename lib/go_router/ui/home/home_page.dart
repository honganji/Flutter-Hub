import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home Page'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/home/detail'),
              child: const Text('Go to Detail Page'),
            ),
          ],
        ),
      ),
    );
  }
}
