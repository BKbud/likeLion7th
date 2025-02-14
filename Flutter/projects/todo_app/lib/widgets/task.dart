// Task 위젯을 구성
import 'package:flutter/material.dart';
import '../models/task_manager.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final TaskManager taskManager;
  final VoidCallback notifyParent;

  TaskTile(
      {Key? key,
      required this.task,
      required this.taskManager,
      required this.notifyParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isChecked,
        onChanged: (bool? newValue) async {
          if (newValue != null) {
            int index = taskManager.tasks.indexOf(task);
            if (index != -1) {
              await taskManager.toggleTask(index);
              notifyParent();
            }
          }
        },
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          int index = taskManager.tasks.indexOf(task);
          if (index != -1) {
            await taskManager.removeTask(index);
            notifyParent();
          }
        },
      ),
    );
  }
}
