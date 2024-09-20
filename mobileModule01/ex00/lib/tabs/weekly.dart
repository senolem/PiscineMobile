import 'package:flutter/material.dart';
import 'package:weather_proj/enums/apptab.dart';

class WeeklyTab extends StatefulWidget {
  final AppTab tab;
  final String input;
  final bool geolocationEnabled;

  const WeeklyTab({
    super.key,
    required this.tab,
    required this.input,
    required this.geolocationEnabled
  });

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