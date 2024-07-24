import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:developer';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 74, 71, 71)),
        useMaterial3: true
      ),
      home: const Homepage(title: 'Calculator'),
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
  String expression = '';
  num result = 0;

  void buttonCallback(String value) {
    if (value.isNotEmpty) {
      log('Button $value pressed');
    }
    setState(() {
      if (value == 'C') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (value == 'AC') {
          expression = '';
          result = 0;
      } else if (value == '=') {
          // Calculate
      } else {
        expression += value;
      }
    });
  }

  Expanded calcButton(String value, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: () => buttonCallback(value),
        style: TextButton.styleFrom(
          foregroundColor: color,
          textStyle: const TextStyle(fontWeight: FontWeight.bold)
        ),
        child: Text(value, style: const TextStyle(fontSize: 14))
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 55, 55, 55)),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AutoSizeText(
                      expression,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 2,
                      textAlign: TextAlign.end
                    ),
                    AutoSizeText(
                      result.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      maxLines: 2,
                      textAlign: TextAlign.end
                    )
                  ]
                )
              ),
            )
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 74, 71, 71)),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calcButton('7', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('8', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('9', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('C', const Color.fromARGB(255, 255, 234, 138)),
                        calcButton('AC', const Color.fromARGB(255, 236, 84, 84))
                      ],
                    )
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calcButton('4', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('5', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('6', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('+', const Color.fromARGB(255, 98, 203, 255)),
                        calcButton('-', const Color.fromARGB(255, 98, 203, 255))
                      ],
                    )
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calcButton('1', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('2', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('3', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('*', const Color.fromARGB(255, 98, 203, 255)),
                        calcButton('/', const Color.fromARGB(255, 98, 203, 255))
                      ],
                    )
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        calcButton('', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('0', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('.', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('', const Color.fromARGB(255, 201, 201, 201)),
                        calcButton('=', const Color.fromARGB(255, 197, 255, 182))
                      ],
                    )
                  )
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
