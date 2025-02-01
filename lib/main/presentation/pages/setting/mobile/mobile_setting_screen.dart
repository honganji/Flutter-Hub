import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../application/usecase/title/title_usecase.dart';

class MobileSettingScreen extends HookConsumerWidget {
  const MobileSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titlePro = ref.watch(titleUsecaseProvider);
    final notifier = ref.read(titleUsecaseProvider.notifier);
    final textController = useTextEditingController();
    return Column(
      children: [
        const Center(
          child: Text('Mobile Setting'),
        ),
        const Text('Change the title'),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: titlePro.title,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            notifier.changeTitle(textController.text);
            textController.clear();
          },
          child: const Text('Change'),
        ),
      ],
    );
  }
}
