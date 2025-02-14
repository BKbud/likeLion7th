import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_page.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  // StatelessWidget을 확장받으므로, build 메서드를 override해야한다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My flutter todo app',
      home: HomePage(),
    );
  }
}
