import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold: 기본적인 앱 화면을 구성 (AppBar, body, )
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Button Pressed');
          }, // 추가 버튼 동작,
          backgroundColor: const Color.fromARGB(255, 128, 145, 237),
          child: Icon(Icons.add)),
      backgroundColor: const Color.fromARGB(255, 226, 234, 247),
    );
  }
}
