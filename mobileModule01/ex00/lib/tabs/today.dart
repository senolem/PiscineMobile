import 'package:flutter/material.dart';
import 'package:weather_proj/enums/apptab.dart';

class TodayTab extends StatefulWidget {
  final AppTab tab;

  const TodayTab({super.key, required this.tab});

  @override
  TodayTabState createState() => TodayTabState();
}

class TodayTabState extends State<TodayTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.tab.tabName
      )
    );
  }
}