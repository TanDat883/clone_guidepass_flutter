import 'package:clone_guidepass/models/map_point.dart';

class MapData {
  MapData._();

  /// All available floor IDs in display order.
  static const List<String> floors = [
    'bunker',
    'ground',
    'L1',
    'L2',
    'L3',
    'L4',
    'EX1',
    'EX2',
  ];

  /// Display labels for each floor.
  static const Map<String, String> floorLabels = {
    'bunker': 'Bunker',
    'ground': 'Ground',
    'L1': 'L1',
    'L2': 'L2',
    'L3': 'L3',
    'L4': 'L4',
    'EX1': 'EX1',
    'EX2': 'EX2',
  };

  /// Map image asset for each floor.
  static const Map<String, String> floorImages = {
    'bunker': 'assets/images/maps/floor_bunker.jpg',
    'ground': 'assets/images/maps/floor_ground.jpg',
    'L1': 'assets/images/maps/floor_bunker.jpg',
    'L2': 'assets/images/maps/floor_ground.jpg',
    'L3': 'assets/images/maps/floor_bunker.jpg',
    'L4': 'assets/images/maps/floor_ground.jpg',
    'EX1': 'assets/images/maps/floor_bunker.jpg',
    'EX2': 'assets/images/maps/floor_ground.jpg',
  };

  /// All interactive points on the maps.
  static const List<MapPoint> points = [
    // ── Bunker ──
    MapPoint(id: '00', label: '00', x: 0.30, y: 0.40, floor: 'bunker'),
    MapPoint(id: '01', label: '01', x: 0.55, y: 0.35, floor: 'bunker'),
    MapPoint(id: '02', label: '02', x: 0.70, y: 0.50, floor: 'bunker'),

    // ── Ground ──
    MapPoint(id: '07', label: '07', x: 0.12, y: 0.55, floor: 'ground'),
    MapPoint(id: '08', label: '08', x: 0.78, y: 0.28, floor: 'ground'),
    MapPoint(id: '32', label: '32', x: 0.62, y: 0.58, floor: 'ground'),

    // ── L1 ──
    MapPoint(id: '19', label: '19', x: 0.62, y: 0.30, floor: 'L1'),
    MapPoint(id: '21', label: '21', x: 0.68, y: 0.45, floor: 'L1'),
    MapPoint(id: '35', label: '35', x: 0.52, y: 0.42, floor: 'L1'),

    // ── L2 ──
    MapPoint(id: '10', label: '10', x: 0.45, y: 0.35, floor: 'L2'),
    MapPoint(id: '11', label: '11', x: 0.65, y: 0.50, floor: 'L2'),
    MapPoint(id: '12', label: '12', x: 0.35, y: 0.55, floor: 'L2'),

    // ── L3 ──
    MapPoint(id: '13', label: '13', x: 0.50, y: 0.30, floor: 'L3'),
    MapPoint(id: '14', label: '14', x: 0.40, y: 0.55, floor: 'L3'),

    // ── L4 ──
    MapPoint(id: '15', label: '15', x: 0.55, y: 0.40, floor: 'L4'),

    // ── EX1 ──
    MapPoint(id: '16', label: '16', x: 0.50, y: 0.50, floor: 'EX1'),
    MapPoint(id: '17', label: '17', x: 0.35, y: 0.35, floor: 'EX1'),

    // ── EX2 ──
    MapPoint(id: '18', label: '18', x: 0.50, y: 0.45, floor: 'EX2'),
  ];

  /// Get all points for a specific floor.
  static List<MapPoint> getPointsForFloor(String floor) {
    return points.where((p) => p.floor == floor).toList();
  }
}
