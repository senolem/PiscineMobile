import 'package:flutter/material.dart';
import 'enums/apptab.dart';
import 'dart:developer';
import 'package:weather_proj/tabs/currently.dart';
import 'package:weather_proj/tabs/today.dart';
import 'package:weather_proj/tabs/weekly.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 72, 71, 74)),
        useMaterial3: true
      ),
      home: const Homepage(title: 'Weather'),
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
  String input = '';
  bool geolocationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Expanded(
              child: TextField(
                onChanged: (value) => inputChanged(value),
              )
            ),
            ElevatedButton(
              onPressed: () => { geolocationEnabled = !geolocationEnabled },
              child: geolocationEnabled? const Icon(Icons.location_city) : const Icon(Icons.location_disabled)
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).colorScheme.inversePrimary,
          child: TabBar(
            tabs: [
              Tab(text: AppTab.currently.tabName, icon: const Icon(Icons.sunny)),
              Tab(text: AppTab.today.tabName, icon: const Icon(Icons.calendar_today)),
              Tab(text: AppTab.weekly.tabName, icon: const Icon(Icons.calendar_month))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CurrentlyTab(tab: AppTab.currently, input: input, geolocationEnabled: geolocationEnabled),
            TodayTab(tab: AppTab.today, input: input, geolocationEnabled: geolocationEnabled),
            WeeklyTab(tab: AppTab.weekly, input: input, geolocationEnabled: geolocationEnabled)
          ],
        ),
      ),
    );
  }

  void switchTab(AppTab tab) {
    log('Switching to tab ${tab.tabName}');
  }

  void inputChanged(String value) {
    input = value;
    geolocationEnabled = false;
  }
}