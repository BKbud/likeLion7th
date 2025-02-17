import 'package:flutter/material.dart';

/*
 * 선언형 navigator
*/
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('appBar')),
        body: const Center(
          child: Text('HomePage'),
        ));
  }
}
