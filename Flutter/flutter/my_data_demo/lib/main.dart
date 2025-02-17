import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyData {
  final List<String> items = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'june',
    'july',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final data = MyData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('My Data App')),
        body: ListView.builder(
          itemCount: data.items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(data.items[index]));
          },
        ),
      ),
    );
  }
}
