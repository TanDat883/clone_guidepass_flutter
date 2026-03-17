import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/models/tour.dart';
import 'package:clone_guidepass/screens/tour/widgets/tour_card.dart';
import 'package:clone_guidepass/screens/tour/poi_detail_screen.dart';

class TourSpotListScreen extends StatelessWidget {
  final Tour tour;

  const TourSpotListScreen({
    super.key,
    required this.tour,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgLight,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryRed,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          tour.name,
          style: const TextStyle(
            color: AppTheme.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppTheme.spacingMD),
        itemCount: tour.spots.length,
        itemBuilder: (context, index) {
          final spot = tour.spots[index];
          return TourCard(
            spot: spot,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PoiDetailScreen(spot: spot),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
