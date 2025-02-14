// homePage 화면을 구성
import 'package:flutter/material.dart';
import 'add_task_screen.dart';

class HomePage extends StatelessWidget {
  @override
  // context: 위젯 트리에서 현재 위젯의 위치나 상태를 알 수 있게 해주는 객체
  Widget build(BuildContext context) {
    // Scaffold: 기본적인 앱 화면을 구성 (AppBar, body etc.)
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) =>
                    SingleChildScrollView(child: AddTaskScreen()));
          }, // 추가 버튼 동작,
          backgroundColor: const Color.fromARGB(255, 128, 145, 237),
          child: Icon(Icons.add)),
      backgroundColor: const Color.fromARGB(255, 226, 234, 247),
    );
  }
}
