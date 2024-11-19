import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:developer';
import 'scrollable_text.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 72, 71, 74)),
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
  String expression = '0';
  double result = 0;
  String resultString = '0';
  Parser p = Parser();
  bool reset = true;

  void buttonCallback(String value) {
    if (value.isNotEmpty) {
      log('Button $value pressed');
    }
    setState(() {
      if (value == 'C') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
          if (expression.isEmpty) {
            expression = '0';
            reset = true;
          }
        }
      } else if (value == 'AC') {
          expression = '0';
          result = 0;
          resultString = '0';
          reset = true;
      } else if (value == '=') {
        calculateExpression();
      } else {
        if (reset) {
          expression = '';
          reset = false;
        }
        expression += value;
      }
    });
  }

  void calculateExpression() {
    try {
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      result = exp.evaluate(EvaluationType.REAL, cm);
      resultString = result.toString();
    } catch (e) {
      String error = e.toString();
      log('Error while calculating expression: $error');
      result = 0;
      resultString = 'Error';
    }
  }

  Expanded calcButton(String value, Color color) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateColor.transparent,
          splashFactory: value.isEmpty ? NoSplash.splashFactory : null,
          enableFeedback: value.isEmpty ? false : true,
          overlayColor: value.isEmpty ? WidgetStateProperty.all(Colors.transparent) : null,
          mouseCursor: value.isEmpty ? WidgetStateProperty.all(MouseCursor.defer) : null,
        ),
        onPressed: value.isEmpty ? null : () => buttonCallback(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color))
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
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 55, 55, 55)),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ScrollableTextWidget(expression: expression),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                      child: AutoSizeText(
                        result.toString(),
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                        maxLines: 2,
                        textAlign: TextAlign.end
                      ),
                    )
                  ]
                )
              ),
            )
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 74, 71, 71)),
              padding: const EdgeInsets.all(8),
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
