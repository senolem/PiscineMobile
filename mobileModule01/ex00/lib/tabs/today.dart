import 'package:flutter/material.dart';
import 'package:weather_proj/enums/apptab.dart';

class TodayTab extends StatefulWidget {
  final AppTab tab;
  final String input;
  final bool geolocationEnabled;

  const TodayTab({
    super.key,
    required this.tab,
    required this.input,
    required this.geolocationEnabled
  });

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