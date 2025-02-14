// homePage 화면을 구성
import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../models/task_manager.dart';
import '../widgets/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final TaskManager taskManager = TaskManager();

  Future<void> _loadTasks() async {
    await taskManager.loadTasks();
    setState(() {}); // 로드 후 UI 업데이트
  }

  @override
  // context: 위젯 트리에서 현재 위젯의 위치나 상태를 알 수 있게 해주는 객체
  Widget build(BuildContext context) {
    // Scaffold: 기본적인 앱 화면을 구성 (AppBar, body etc.)
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: AddTaskScreen(
                    taskManager: taskManager,
                    onTaskAdded: () {
                      // 콜백 함수: task 추가 후 HomePage를 업데이트
                      _loadTasks(); // tasks 다시 로드
                    },
                  ),
                ),
              );
            }, // 추가 버튼 동작,
            backgroundColor: const Color.fromARGB(255, 128, 145, 237),
            child: Icon(Icons.add)),
        backgroundColor: const Color.fromARGB(255, 226, 234, 247),
        body: Container(
            padding: EdgeInsets.all(50),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Icon(Icons.playlist_add_check, size: 40, color: Colors.black),
                SizedBox(width: 30),
                Text('My Todo',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))
              ]),
              const SizedBox(height: 20), // 간격 추가
              Expanded(
                child: ListView.builder(
                  itemCount: taskManager.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskManager.tasks[index];
                    return TaskTile(
                        task: task,
                        taskManager: taskManager,
                        notifyParent: () {
                          setState(() {});
                        }); // TaskTile에 TaskManager 전달
                  },
                ),
              ),
            ])));
  }
}
