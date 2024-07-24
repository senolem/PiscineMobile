import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piscine Mobile 42',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 70, 241, 116)),
        useMaterial3: true
      ),
      home: const Homepage(title: 'Piscine Mobile 42'),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool pressed = false;

  void _changePressed() {
    setState(() {
      pressed = !pressed;
    });
    log('Button pressed');
  }

  @override
  Widget build(BuildContext context) {
    String text = 'A simple text';
    if (pressed) {
      text = 'hello world!';
    }
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            ElevatedButton(
              onPressed: _changePressed,
              child: const Text('Click me'),
            )
          ]
        ),
      )
    );
  }
}
