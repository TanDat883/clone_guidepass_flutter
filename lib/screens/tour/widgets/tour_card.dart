import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/models/tour_spot.dart';

class TourCard extends StatelessWidget {
  final TourSpot spot;
  final VoidCallback? onTap;

  const TourCard({
    super.key,
    required this.spot,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppTheme.spacingMD),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ảnh điểm tham quan
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                spot.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // Tên điểm tham quan
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMD,
                vertical: AppTheme.spacingSM,
              ),
              color: AppTheme.primaryRed,
              child: Text(
                '${spot.id} - ${spot.name}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
