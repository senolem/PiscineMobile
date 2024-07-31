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
      pressed = true;
    });
    log('Button pressed');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: constraints.maxWidth < 600 ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: Center(
              child: _buildMain(size)
            )
          );
        }
      )
    );
  }

  Widget _buildMain(Size size) {
    return Container(
        padding: const EdgeInsets.all(30),
        constraints: const BoxConstraints(maxWidth: 600),
        decoration: const BoxDecoration(color: Color.fromARGB(55, 0, 0, 0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'A simple text',
              style: TextStyle(fontSize: 14)
            ),
            const SizedBox(
              height: 25.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _changePressed,
                child: const Text(
                  'Click me',
                  style: TextStyle(fontSize: 14)
                )
              ),
            )
          ]
        )
    );
  }
}
