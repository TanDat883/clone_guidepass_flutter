import 'package:clone_guidepass/models/tour_spot.dart';

class Tour {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final List<TourSpot> spots;

  const Tour({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.spots,
  });
}
