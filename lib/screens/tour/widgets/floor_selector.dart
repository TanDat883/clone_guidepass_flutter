import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/data/map_data.dart';

/// Horizontal floor tab selector at the bottom of the map view.
/// Shows icons for each floor (bunker, ground, L1–L4, EX1, EX2).
class FloorSelector extends StatelessWidget {
  final String selectedFloor;
  final ValueChanged<String> onFloorSelected;

  const FloorSelector({
    super.key,
    required this.selectedFloor,
    required this.onFloorSelected,
  });

  IconData _getFloorIcon(String floor) {
    switch (floor) {
      case 'bunker':
        return Icons.shield_outlined;
      case 'ground':
        return Icons.landscape_outlined;
      default:
        return Icons.apartment_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: AppTheme.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: MapData.floors.map((floor) {
            final isSelected = floor == selectedFloor;
            final label = MapData.floorLabels[floor] ?? floor;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => onFloorSelected(floor),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 56,
                  decoration: BoxDecoration(
                    border: isSelected
                        ? const Border(
                            bottom: BorderSide(
                              color: AppTheme.primaryRed,
                              width: 3,
                            ),
                          )
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getFloorIcon(floor),
                        size: 24,
                        color: isSelected
                            ? AppTheme.primaryRed
                            : Colors.grey[500],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: isSelected
                              ? AppTheme.primaryRed
                              : Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
