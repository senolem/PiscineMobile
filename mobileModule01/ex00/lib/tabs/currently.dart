import 'package:flutter/material.dart';
import 'package:weather_proj/enums/apptab.dart';

class CurrentlyTab extends StatefulWidget {
  final AppTab tab;

  const CurrentlyTab({super.key, required this.tab});

  @override
  CurrentlyTabState createState() => CurrentlyTabState();
}

class CurrentlyTabState extends State<CurrentlyTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.tab.tabName
      )
    );
  }
}