import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/config/app_routes.dart';
import 'package:clone_guidepass/data/tour_data.dart';
import 'package:clone_guidepass/screens/home/widgets/bottom_action_bar.dart';
import 'package:clone_guidepass/screens/home/widgets/map_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spot = TourData.spots[0];

    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          // ── Scrollable Content ──
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 250.0,
                pinned: true,
                backgroundColor: AppTheme.white,
                elevation: 2,
                iconTheme: const IconThemeData(color: AppTheme.textDark),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingMD,
                      vertical: 6,
                    ),
                    decoration: AppTheme.cardDecoration,
                    child: Text(
                      spot.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ),
                  background: Image.asset(
                    spot.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: AppTheme.white,
                  padding: const EdgeInsets.only(
                    top: AppTheme.spacingLG,
                    left: AppTheme.spacingLG,
                    right: AppTheme.spacingLG,
                    bottom: 120,
                  ),
                  child: Text(
                    spot.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),

          // ── Floating Map Button ──
          MapFab(onPressed: () {}),

          // ── Bottom Action Bar ──
          BottomActionBar(
            onDownloadPressed: () {},
            onStartTourPressed: () {
              Navigator.pushNamed(context, AppRoutes.tourList);
            },
          ),
        ],
      ),
    );
  }
}
