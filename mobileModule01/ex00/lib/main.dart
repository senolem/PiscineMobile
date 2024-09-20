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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: true
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
        body: const TabBarView(
          children: [
            CurrentlyTab(tab: AppTab.currently),
            TodayTab(tab: AppTab.today),
            WeeklyTab(tab: AppTab.weekly)
          ],
        ),
      ),
    );
  }

  void switchTab(AppTab tab) {
    log('Switching to tab ${tab.tabName}');
  }
}