import 'package:flutter/material.dart';

import 'tab_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          // themeData의 tabBarTheme 속성을 사용하여 탭바의 색상을 변경
          tabBarTheme: const TabBarTheme(
            indicatorColor: Colors.amber, // 선택된 탭 표시 색상
            labelColor: Colors.amber, // 선택된 탭 텍스트 색상
            unselectedLabelColor: Colors.grey, // 선택되지 않은 탭 텍스트 색상
          )),
      home: TabDemo(),
    );
  }
}
