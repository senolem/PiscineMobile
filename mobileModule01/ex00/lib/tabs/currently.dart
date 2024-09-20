import 'package:flutter/material.dart';
import 'package:weather_proj/enums/apptab.dart';

class CurrentlyTab extends StatefulWidget {
  final AppTab tab;
  final String input;
  final bool geolocationEnabled;

  const CurrentlyTab({
    super.key,
    required this.tab,
    required this.input,
    required this.geolocationEnabled
  });

  @override
  CurrentlyTabState createState() => CurrentlyTabState();
}

class CurrentlyTabState extends State<CurrentlyTab> {
  @override
  Widget build(BuildContext context) {
    String text = widget.tab.tabName;
    text += widget.geolocationEnabled ? 'Geolocation' : widget.input;
    return Center(
      child: Text(
        widget.tab.tabName
      )
    );
  }
}