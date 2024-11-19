import 'package:flutter/material.dart';

class ScrollableTextWidget extends StatefulWidget {
  final String expression;

  const ScrollableTextWidget({super.key, required this.expression});

  @override
  ScrollableTextWidgetState createState() => ScrollableTextWidgetState();
}

class ScrollableTextWidgetState extends State<ScrollableTextWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ScrollableTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: RawScrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Text(
              widget.expression,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.end,
            )
          ),
        ),
      ),
    );
  }
}