import 'package:flutter/material.dart';

/*
 * Navigator.of(context).push 네비게이터 스택에 새로운 화면을 push한다.
 * Navigator.of(context): 이 위젯이 속한 앱의 네비게이션 시스템을 찾아서 사용하겠다"는 의미
 * 볼록 튀어나와보이는 걸 'Elevated'라 표현한다.
 * ElevatedButton: 화면에서 튀어나와보이는 버튼
*/
class NavigatorDemo extends StatelessWidget {
  const NavigatorDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return MyDetails(itemTitle: 'January');
                },
              ),
            );
          },
          child: const Text('Go to January'),
        ),
      ),
    );
  }
}

// Navigator.of(context).pop -> 현재 뷰를 pop
class MyDetails extends StatelessWidget {
  const MyDetails({super.key, required this.itemTitle});
  final String itemTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
