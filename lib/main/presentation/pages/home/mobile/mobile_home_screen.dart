import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hub/main/application/usecase/streams/japanese_stream.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/usecase/hooks/counter_hook.dart';

class MobileHomeScreen extends HookWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useCounter();
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    final currentCharacter = useStream(hiraganaStream, initialData: 'あ');

    useEffect(
      () {
        animationController.repeat(reverse: true);
        return animationController.dispose;
      },
      [animationController],
    );
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
          Row(
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
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1 + animationController.value,
                child: child,
              );
            },
            child: const Icon(Icons.favorite),
          ),
          Text(currentCharacter.data ?? '文字が取得できませんでした'),
        ],
      ),
    );
  }
}
