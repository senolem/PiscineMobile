import 'package:flutter/material.dart';
import 'package:weather_proj/enums/apptab.dart';

class WeeklyTab extends StatefulWidget {
  final AppTab tab;

  const WeeklyTab({super.key, required this.tab});

  @override
  WeeklyTabState createState() => WeeklyTabState();
}

class WeeklyTabState extends State<WeeklyTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.tab.tabName
      )
    );
  }
}