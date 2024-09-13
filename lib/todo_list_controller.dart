import 'package:tarefas_v1/todo.dart';
import 'package:tarefas_v1/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();

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
}
