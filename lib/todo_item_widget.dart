import 'package:flutter/material.dart';
import 'package:tarefas_v1/todo.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late TextEditingController todoController;

  @override
  void initState() {
    todoController = TextEditingController(text: widget.todo.task);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: todoController,
        decoration:
            const InputDecoration.collapsed(hintText: 'escreva sua tarefa'),
        onChanged: onChanged,
      ),
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: onToggled,
      ),
      trailing: IconButton(
        onPressed: onDeleted,
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.close_rounded),
      ),
    );
  }

  void onChanged(String task) {
    print(task);
  }

  void onToggled(_) {
    print(_);
  }

  void onDeleted() {
    print('deleted');
  }
}
