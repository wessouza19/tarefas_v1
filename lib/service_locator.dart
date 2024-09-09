import 'package:get_it/get_it.dart';
import 'package:tarefas_v1/todo_list_controller.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<TodoListController>(() => TodoListController());
}
