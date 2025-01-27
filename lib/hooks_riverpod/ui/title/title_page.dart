import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hub/hooks_riverpod/usecase/title/title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitlePage extends HookConsumerWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleDataProvider);
    final notifier = ref.read(titleDataProvider.notifier);
    final textController = useTextEditingController(text: title.title);
    return Scaffold(
      appBar: AppBar(
        title: Text(title.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: TextFormField(controller: textController),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              notifier.changeTitle(textController.text);
              textController.clear();
            },
            child: const Text('Change Title'),
          ),
        ],
      ),
    );
  }
}
