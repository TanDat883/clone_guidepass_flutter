import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const GuideApp());
}

class GuideApp extends StatelessWidget {
  const GuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guide App Vietnam',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const WelcomeScreen(),
    );
  }
}