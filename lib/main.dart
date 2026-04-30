import 'package:flutter/material.dart';
import 'package:tourism_guide/theme/app_theme.dart';
import 'package:tourism_guide/screens/home_screen.dart';

void main() {
  runApp(const TourMateApp());
}

class TourMateApp extends StatelessWidget {
  const TourMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TourMate BD',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
