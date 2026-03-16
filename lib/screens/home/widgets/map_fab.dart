import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';

class MapFab extends StatelessWidget {
  final VoidCallback? onPressed;

  const MapFab({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      right: AppTheme.spacingLG,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: AppTheme.primaryRed,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.map, color: AppTheme.white, size: 26),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
