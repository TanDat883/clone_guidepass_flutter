import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/models/map_point.dart';

/// A numbered, circular red pin marker for the interactive map.
class MapPinMarker extends StatelessWidget {
  final MapPoint point;
  final VoidCallback onTap;
  final bool isSelected;

  const MapPinMarker({
    super.key,
    required this.point,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isSelected ? 40 : 34,
        height: isSelected ? 40 : 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? const Color(0xFFD32F2F)
              : AppTheme.primaryRed,
          border: Border.all(
            color: AppTheme.white,
            width: 2.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(isSelected ? 80 : 50),
              blurRadius: isSelected ? 8 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            point.label,
            style: const TextStyle(
              color: AppTheme.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
