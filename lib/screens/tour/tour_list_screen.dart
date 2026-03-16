import 'package:flutter/material.dart';
import 'package:clone_guidepass/models/tour_spot.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/data/tour_data.dart';
import 'package:clone_guidepass/widgets/language_dialog.dart';
import 'package:clone_guidepass/screens/tour/widgets/tour_card.dart';
import 'package:clone_guidepass/screens/tour/widgets/tour_bottom_nav.dart';
import 'package:clone_guidepass/screens/tour/widgets/keypad_view.dart';

class TourListScreen extends StatefulWidget {
  const TourListScreen({super.key});

  @override
  State<TourListScreen> createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {
  int _currentNavIndex = 0;

  void _showLanguageDialog() {
    showLanguageDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    final spots = TourData.spots;

    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryRed,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _currentNavIndex == 1 ? 'POI' : '1-Dinh Độc Lập',
          style: const TextStyle(
            color: AppTheme.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: AppTheme.white),
            onPressed: _showLanguageDialog,
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: AppTheme.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(spots),
      bottomNavigationBar: TourBottomNav(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody(List<TourSpot> spots) {
    if (_currentNavIndex == 1) {
      return const KeypadView();
    }
    
    // Default: Danh sách (index 0)
    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacingMD),
      itemCount: spots.length,
      itemBuilder: (context, index) {
        return TourCard(
          spot: spots[index],
          onTap: () {
            // TODO: Navigate to spot detail
          },
        );
      },
    );
  }
}
