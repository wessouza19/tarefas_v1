import 'package:flutter/material.dart';
import 'package:tarefas_v1/service_locator.dart';
import 'package:tarefas_v1/todo_list_page.dart';

void main() {
  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const TodoListPage(),
    );
  }
}
