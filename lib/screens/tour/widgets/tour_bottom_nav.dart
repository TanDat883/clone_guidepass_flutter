import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';

class TourBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const TourBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppTheme.white,
      unselectedItemColor: AppTheme.white.withOpacity(0.6),
      backgroundColor: AppTheme.primaryRed,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Danh sách',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.keyboard),
          label: 'Bàn phím',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Map',
        ),
      ],
    );
  }
}
