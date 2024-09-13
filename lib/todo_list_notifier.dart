import 'package:flutter/material.dart';
import 'package:tarefas_v1/todo.dart';

class TodoListNotifier extends ValueNotifier<List<Todo>> {
  TodoListNotifier() : super(_initilalValue);

  static final List<Todo> _initilalValue = [
    Todo.create("Task 1"),
    Todo.create("Task 2"),
    Todo.create("Task 3"),
    Todo.create("Task 4"),
    Todo.create("Task 5"),
  ];
  void add(Todo todo) {
    value = [...value, todo];
  }

  void update(String id, String task) {
    value = [
      for (final todo in value)
        if (todo.id != id) todo else todo.copyWith(task: task)
    ];
  }

  void toggle(String id) {
    value = [
      for (final todo in value)
        if (todo.id != id) todo else todo.copyWith(completed: !todo.completed)
    ];
  }

  void remove(String id) {
    value = value.where((todo) => todo.id != id).toList();
  }
}
