import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/todo.dart';
import 'shared_preference_provider.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  static const _key = 'todos';
  @override
  Future<List<Todo>> build() async {
    final sps = ref.read(sharedPreferenceProvider);
    final list = sps.getString(_key);
    if (list != null) {
      final decodedList = json.decode(list) as List<Map<String, dynamic>>;
      return decodedList.map((element) {
        return Todo.fromJson(element);
      }).toList();
    }
    return [];
  }

  Future<void> _updateList(List<Todo> list) async {
    final sps = ref.read(sharedPreferenceProvider);
    final encodedList = list.map((e) => e.toJson()).toList();
    await sps.setString(_key, json.encode(encodedList));
    await getTodos();
  }

  Future<void> getTodos() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final sps = ref.read(sharedPreferenceProvider);
      final list = sps.getString(_key);
      if (list != null) {
        final decodedList = json.decode(list) as List<dynamic>;
        final todos = decodedList.map((element) {
          return Todo.fromJson(element as Map<String, dynamic>);
        }).toList();
        return todos;
      }
      return [];
    });
  }

  Future<void> addTodo(Todo todo) async {
    state = const AsyncValue.loading();
    final list = <Todo>[...state.value ?? [], todo];
    print(todo);
    await AsyncValue.guard(() async {
      await _updateList(list);
    });
  }

  Future<void> removeTodo(String todoId) async {
    var list = state.value ?? [];
    list = list.where((todo) => todo.id != todoId).toList();
    await AsyncValue.guard(() async {
      await _updateList(list);
    });
  }

  Future<void> toggle(String todoId) async {
    var list = state.value ?? [];
    list = list.map((todo) {
      if (todo.id == todoId) {
        return todo.copyWith(completed: !todo.completed);
      }
      return todo;
    }).toList();
    await AsyncValue.guard(() async {
      await _updateList(list);
    });
  }
}
