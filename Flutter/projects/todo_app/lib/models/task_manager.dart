import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TaskManager {
  List<Task> tasks = [];

  // 생성자: 초기화 시에 로드하도록 설정
  TaskManager() {
    loadTasks();
  }

  Future<void> addTask(String title) async {
    tasks.add(Task(title: title));
    await saveTasks();
  }

  Future<void> removeTask(int index) async {
    tasks.removeAt(index);
    await saveTasks();
  }

  Future<void> toggleTask(int index) async {
    tasks[index].isChecked = !tasks[index].isChecked;
    await saveTasks();
  }

  Future<void> saveTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String tasksString =
        jsonEncode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', tasksString);
  }

  Future<void> loadTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('tasks');

    if (tasksString != null) {
      final List<dynamic> tasksJson = jsonDecode(tasksString);
      tasks = tasksJson.map((json) => Task.fromJson(json)).toList();
    }
  }
}

class Task {
  String title;
  bool isChecked;

  Task({required this.title, this.isChecked = false});

  // JSON으로 변환하기 위한 메서드
  Map<String, dynamic> toJson() => {
        'title': title,
        'isChecked': isChecked,
      };

  // JSON에서 Task객체로 변환하기 위한 생성자
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        isChecked: json['isChecked'],
      );
}
