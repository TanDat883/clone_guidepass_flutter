class TourSpot {
  final String id;
  final String name;
  final String imagePath;
  final String? audioPath;
  final String? floor;

  const TourSpot({
    required this.id,
    required this.name,
    required this.imagePath,
    this.audioPath,
    this.floor,
  });
}
