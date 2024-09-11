import 'package:tarefas_v1/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();

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
