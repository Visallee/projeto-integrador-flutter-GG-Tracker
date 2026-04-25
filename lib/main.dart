import 'package:flutter/material.dart';
import 'package:gg_tracker_workspace/pages/home_page.dart';
import 'package:gg_tracker_workspace/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GG Tracker',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
