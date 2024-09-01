import 'package:flutter/material.dart';
import 'package:tarefas_v1/todo.dart';

List<Todo> todoList = [
  Todo.create("Task 1"),
  Todo.create("Task 2"),
  Todo.create("Task 3"),
  Todo.create("Task 4"),
  Todo.create("Task 5"),
];

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todoList[index].task),
        );
      },
    );
  }
}
