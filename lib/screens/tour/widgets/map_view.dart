import 'package:flutter/material.dart';
import 'package:clone_guidepass/data/map_data.dart';
import 'package:clone_guidepass/data/tour_data.dart';
import 'package:clone_guidepass/models/map_point.dart';
import 'package:clone_guidepass/screens/tour/widgets/map_pin_marker.dart';
import 'package:clone_guidepass/screens/tour/widgets/floor_selector.dart';
import 'package:clone_guidepass/screens/tour/poi_detail_screen.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  String _selectedFloor = 'L1';
  String? _selectedPointId;

  final TransformationController _transformController =
      TransformationController();

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }

  void _onPinTap(MapPoint point) {
    setState(() {
      _selectedPointId = point.id;
    });

    final spot = TourData.findById(point.id);
    if (spot != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PoiDetailScreen(spot: spot),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final floorPoints = MapData.getPointsForFloor(_selectedFloor);
    final imagePath = MapData.floorImages[_selectedFloor];

    return Column(
      children: [
        Expanded(
          child: Container(
            color: const Color(0xFFF2F2F2),
            child: InteractiveViewer(
              transformationController: _transformController,
              minScale: 0.5,
              maxScale: 4.0,
              boundaryMargin: const EdgeInsets.all(100),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Stack(
                      children: [
                        // Floor image
                        Positioned.fill(
                          child: imagePath != null
                              ? Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stack) =>
                                      _buildNoImagePlaceholder(),
                                )
                              : _buildNoImagePlaceholder(),
                        ),
                        // Pin markers
                        ...floorPoints.map((point) {
                          return _buildPositionedPin(
                            point,
                            constraints.maxWidth,
                            constraints.maxHeight,
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        FloorSelector(
          selectedFloor: _selectedFloor,
          onFloorSelected: (floor) {
            setState(() {
              _selectedFloor = floor;
              _selectedPointId = null;
              _transformController.value = Matrix4.identity();
            });
          },
        ),
      ],
    );
  }

  Widget _buildNoImagePlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map_outlined, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 12),
          Text(
            'Chưa có hình bản đồ cho ${MapData.floorLabels[_selectedFloor]}',
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  Widget _buildPositionedPin(
    MapPoint point,
    double width,
    double height,
  ) {
    const pinSize = 34.0;
    final left = point.x * width - pinSize / 2;
    final top = point.y * height - pinSize / 2;

    return Positioned(
      left: left,
      top: top,
      child: MapPinMarker(
        point: point,
        isSelected: _selectedPointId == point.id,
        onTap: () => _onPinTap(point),
      ),
    );
  }
}
