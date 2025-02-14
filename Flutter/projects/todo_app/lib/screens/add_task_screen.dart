// task 추가 화면을 구성
import 'package:flutter/material.dart';
import '../models/task_manager.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskManager taskManager;
  final VoidCallback onTaskAdded; // 콜백 함수
  final TextEditingController _controller = TextEditingController();

  AddTaskScreen({required this.taskManager, required this.onTaskAdded});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                )),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'New Task'),
              autofocus: true,
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _addTask(context);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: Text('Add',
                    style: TextStyle(
                      fontSize: 20,
                    ))),
          ],
        ));
  }

  void _addTask(BuildContext context) async {
    final title = _controller.text; // 입력된 텍스트 가져오기
    await taskManager.addTask(title); // TaskManager를 사용하여 할 일 추가
    _controller.clear(); // 텍스트 필드 초기화
    onTaskAdded();
    Navigator.pop(context); // AddTaskScreen 닫기
  }
}
