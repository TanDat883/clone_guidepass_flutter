import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_routes.dart';
import 'package:clone_guidepass/config/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.home);
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.fill,
            ),
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppTheme.darkRed,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppTheme.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
