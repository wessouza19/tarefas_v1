import 'package:flutter/material.dart';
import 'package:tarefas_v1/service_locator.dart';
import 'package:tarefas_v1/todo_filter.dart';
import 'package:tarefas_v1/todo_item_widget.dart';
import 'package:tarefas_v1/todo_list_controller.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({super.key});

  final controller = getIt<TodoListController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.todoListNotifier,
      builder: (context, todoList, child) {
        var isFilterAll = controller.filterNotifier.value == TodoFilter.all;

        if (todoList.isEmpty && isFilterAll) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Nenhuma tarefa a fazer..."),
            ),
          );
        }

        return ReorderableListView.builder(
          primary: false,
          shrinkWrap: true,
          buildDefaultDragHandles: isFilterAll,
          itemCount: todoList.length,
          onReorder: controller.reorder,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return TodoItemWidget(key: ValueKey(todo.id), todo: todo);
          },
        );
      },
    );
  }
}
