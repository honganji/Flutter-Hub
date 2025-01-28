import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/usecase/hooks/counter_hook.dart';

class MobileHomeScreen extends HookWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useCounter();
    return Center(
      child: Column(
        children: [
          const Text('mobile Home'),
          ElevatedButton(
            onPressed: () => context.go("/errrrr"),
            child: const Text('Error happens'),
          ),
          const SizedBox(height: 20),
          Text(counter.value.toString()),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counter.decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    counter.increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
