import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:tarefas_v1/storage_service.dart';
import 'package:tarefas_v1/todo.dart';

class HiveStorage extends StorageService {
  static const todosBoxName = 'todos';

  @override
  Future<List<Todo>> getTodos() async {
    final todosBox = await Hive.openBox<String>(todosBoxName);

    return todosBox.values
        .map((todo) => Todo.fromJson(jsonDecode(todo)))
        .toList();
    //return data;
  }

  @override
  Future<void> saveTodos(List<Todo> todos) async {
    final todosBox = await Hive.openBox<String>(todosBoxName);
    await todosBox.clear();

    for (final todo in todos) {
      todosBox.add(jsonEncode(todo));
    }
  }
}
