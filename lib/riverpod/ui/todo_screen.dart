import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../providers/todo_list_provider.dart';
import '../utils/gen_randeom_string.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final todos = ref.watch(todoListProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo App'),
          ),
          body: todos.when(
              data: (data) => Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Enter Todo',
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final todo = data[index];
                            return ListTile(
                              title: Text(todo.description),
                              trailing: Checkbox(
                                value: todo.completed,
                                onChanged: (value) {
                                  ref
                                      .read(todoListProvider.notifier)
                                      .toggle(todo.id);
                                },
                              ),
                              onLongPress: () => ref
                                  .read(todoListProvider.notifier)
                                  .removeTodo(todo.id),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
              error: (error, stack) => Center(
                    child: Text('Error: $error'),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_controller.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a todo'),
                  ),
                );
                return;
              }
              ref.read(todoListProvider.notifier).addTodo(
                    Todo(
                      id: generateRandomString(),
                      description: _controller.text,
                      completed: false,
                    ),
                  );
              _controller.clear();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
