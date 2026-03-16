import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/config/app_routes.dart';

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
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.welcome,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}