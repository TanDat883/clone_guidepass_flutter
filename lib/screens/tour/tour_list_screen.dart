import 'package:flutter/material.dart';
import 'package:clone_guidepass/models/tour.dart';
import 'package:clone_guidepass/models/tour_spot.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/data/tour_data.dart';
import 'package:clone_guidepass/widgets/language_dialog.dart';
import 'package:clone_guidepass/screens/tour/widgets/tour_group_card.dart';
import 'package:clone_guidepass/screens/tour/widgets/tour_bottom_nav.dart';
import 'package:clone_guidepass/screens/tour/widgets/keypad_view.dart';
import 'package:clone_guidepass/screens/tour/widgets/map_view.dart';
import 'package:clone_guidepass/screens/tour/tour_spot_list_screen.dart';

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

  String _getAppBarTitle() {
    switch (_currentNavIndex) {
      case 0:
        return 'Danh sách';
      case 1:
        return 'Bàn phím';
      case 2:
        return 'Bản đồ';
      default:
        return '1-Dinh Độc Lập';
    }
  }

  @override
  Widget build(BuildContext context) {
    final tours = TourData.tours;

    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryRed,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _getAppBarTitle(),
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
      body: _buildBody(tours),
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

  Widget _buildBody(List<Tour> tours) {
    switch (_currentNavIndex) {
      case 1:
        return const KeypadView();
      case 2:
        return const MapView();
      default:
        return ListView.builder(
          padding: const EdgeInsets.all(AppTheme.spacingMD),
          itemCount: tours.length,
          itemBuilder: (context, index) {
            final tour = tours[index];
            return TourGroupCard(
              tour: tour,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TourSpotListScreen(tour: tour),
                  ),
                );
              },
            );
          },
        );
    }
  }
}
