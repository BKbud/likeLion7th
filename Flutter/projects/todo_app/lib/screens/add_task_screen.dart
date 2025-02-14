// task 추가 화면을 구성
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  String? newTaskTitle;

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
                autofocus: true,
                onChanged: ((value) {
                  newTaskTitle = value;
                })),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  // save task
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
}
