import 'package:flutter/material.dart';
import 'package:layout_demo/grid_screen.dart';
import 'package:layout_demo/list_screen.dart';

void main() {
  // runApp(const MyApp());
  // runApp(ListScreen());
  runApp(GridScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('반응형 UI 예제')),
        body: Column(
          children: [
            LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                double fontSize = constraints.maxWidth > 600 ? 32 : 24;
                return Center(
                  child: Text('반응형 텍스트', style: TextStyle(fontSize: fontSize)),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  flex: 2, // 2:1 비율
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.red,
                    child: Text('위젯 1'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.green,
                    child: Text('위젯 2'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
