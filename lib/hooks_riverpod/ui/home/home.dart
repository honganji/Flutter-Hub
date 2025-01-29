import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../usecase/title/title.dart';
import '../title/title_page.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleDataProvider);
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(title.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.value.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () => counter.value++, icon: const Icon(Icons.add)),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<TitlePage>(
                  builder: (context) => const TitlePage(),
                ),
              ),
              child: const Text('Change Title'),
            ),
          ],
        ),
      ),
    );
  }
}
