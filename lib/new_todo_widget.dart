import 'package:flutter/material.dart';
import 'package:tarefas_v1/service_locator.dart';
import 'package:tarefas_v1/todo.dart';
import 'package:tarefas_v1/todo_list_controller.dart';

class NewTodoWidget extends StatefulWidget {
  const NewTodoWidget({
    super.key,
  });

  @override
  State<NewTodoWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends State<NewTodoWidget> {
  late TextEditingController todoController = TextEditingController();
  final controller = getIt<TodoListController>();
  final todoNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Form(
        key: formKey,
        child: TextFormField(
          focusNode: todoNode,
          controller: todoController,
          decoration: const InputDecoration.collapsed(
              hintText: 'Escreva uma nova tarefa'),
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Escreva uma tarefa';
            }
            return null;
          },
          onFieldSubmitted: (_) => onSubmitted(),
        ),
      ),
      leading: const Checkbox(
        value: false,
        onChanged: null,
      ),
      trailing: TextButton(
        onPressed: onSubmitted,
        child: Text('Save'),
      ),
    );
  }

  void onSubmitted() {
    if (!formKey.currentState!.validate()) return;

    controller.add(todoController.text);
    formKey.currentState!.reset();

    todoNode.unfocus();
  }
}
