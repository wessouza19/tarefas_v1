import 'package:flutter/material.dart';
import 'package:tarefas_v1/todo.dart';
import 'package:tarefas_v1/todo_filter.dart';
import 'package:tarefas_v1/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();
  final filterNotifier = ValueNotifier<TodoFilter>(TodoFilter.all);

  void init() {
    todoListNotifier.init();
    filterNotifier
        .addListener(() => todoListNotifier.changeFilter(filterNotifier.value));
    {}
  }

  void add(String task) {
    todoListNotifier.add(Todo.create(task));
  }

  void update(String id, String task) {
    todoListNotifier.update(id, task);
  }

  void toggle(String id) {
    todoListNotifier.toggle(id);
  }

  void remove(String id) {
    todoListNotifier.remove(id);
  }

  void changeFilter(TodoFilter filter) {
    filterNotifier.value = filter;
  }

  void reorder(oldIndex, newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final todos = todoListNotifier.value;
    final todo = todos.removeAt(oldIndex);
    todos.insert(newIndex, todo);

    todoListNotifier.reorder(todos);
  }
}
