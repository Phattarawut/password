import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.lock,
              size: 80.0,
              color: Colors.black54,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Text(
              'กรุณาใส่รหัสผ่าน',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Column(
            children: [
              for (var i = 1; i <= 3; i++) _buildRowButton(i * 3),
              _buildLastRowButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {}, child: const Text('ลืมรหัสผ่าน')),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row _buildRowButton(int num) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (var i = num - 2; i <= num; i++) _buildButton(num: i)],
    );
  }

  Row _buildLastRowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(),
        _buildButton(num: 0),
        _buildButton(num: -1),
      ],
    );
  }

  Padding _buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: 75.0,
        height: 75.0,
        decoration: (num != null && num >= 0)
            ? BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.0),
              )
            : null,
        child: (num == null)
            ? null
            : (num >= 0)
                ? Text(
                    num.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  )
                : const Icon(Icons.backspace_outlined),
      ),
    );
  }
}
