import 'package:flutter/material.dart';
import 'package:todo_app_with_skeleton/src/settings/settings_view.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});
  static const routeName = '/';

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        // actions: A list of Widgets to display in a row after the [title] widget.
        actions: [
          IconButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
