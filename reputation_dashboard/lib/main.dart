import 'package:flutter/material.dart';
import 'package:reputation_dashboard/dashboard/dashboard.dart';

void main() {
  runApp(const SuperteamReputationDashboardApp());
}

class SuperteamReputationDashboardApp extends StatelessWidget {
  const SuperteamReputationDashboardApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.light,
      ),
      home: ReputationDashboard(),
    );
  }
}
