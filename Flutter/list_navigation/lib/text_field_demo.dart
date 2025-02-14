import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldExample();
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  // createState(): Flutter 프레임워크가 StatefulWidget의 State 객체를 생성해야 할 때 호출하는 메서드
  // State 클래스의 인스턴스를 반환하는 createState() 메서드를 구현
  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Scaffold는 기본적인 앱 화면 구조를 제공합니다.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // TextField는 사용자로부터 텍스트 입력을 받는 위젯입니다.
            TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    labelText: 'Enter your username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder())),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'Enter your password',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder()),
              // obscureText 속성을 사용하여 입력한 텍스트를 숨깁니다.
              obscureText: true,
            ),
            // ElevatedButton은 클릭 시 AlertDialog를 표시하는 버튼입니다.
            ElevatedButton(
              onPressed: () {
                // showDialog는 AlertDialog를 표시하는 함수입니다.
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Text Field Value'),
                      content:
                          Text('The value you entered is: ${_controller.text}'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Value'),
            ),
          ],
        ),
      ),
    );
  }
}
