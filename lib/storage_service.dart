import 'package:tarefas_v1/todo.dart';

abstract class StorageService {
  Future<List<Todo>> getTodos();
  Future<void> saveTodos(List<Todo> todos);
}
