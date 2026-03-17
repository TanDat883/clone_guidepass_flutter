import 'package:clone_guidepass/models/tour_spot.dart';
import 'package:clone_guidepass/models/tour.dart';

class TourData {
  TourData._();

  // ══════════════════════════════════════
  // Tất cả các điểm tham quan (POI spots)
  // ══════════════════════════════════════

  static const List<TourSpot> allSpots = [
    // ── Tour 0: Dinh Độc Lập ──
    TourSpot(
      id: '00',
      name: 'Dinh Độc Lập',
      imagePath: 'assets/images/background.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'bunker',
    ),
    TourSpot(
      id: '01',
      name: 'Phòng Họp Nội Các',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'bunker',
    ),
    TourSpot(
      id: '02',
      name: 'Hầm Bí Mật',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'bunker',
    ),
    TourSpot(
      id: '03',
      name: 'Phòng Thông Tin',
      imagePath: 'assets/images/background.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'bunker',
    ),
    TourSpot(
      id: '04',
      name: 'Phòng Chỉ Huy',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'bunker',
    ),

    // ── Tour 1: Tòa nhà Triển lãm ──
    TourSpot(
      id: '07',
      name: 'Sảnh Chính',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'ground',
    ),
    TourSpot(
      id: '08',
      name: 'Khu Vườn',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'ground',
    ),
    TourSpot(
      id: '09',
      name: 'Đài Phun Nước',
      imagePath: 'assets/images/background.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'ground',
    ),
    TourSpot(
      id: '10',
      name: 'Phòng Khách Nhà Nước',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L2',
    ),
    TourSpot(
      id: '11',
      name: 'Phòng Tiệc',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L2',
    ),

    // ── Tour 2: Khu vực tầng trên ──
    TourSpot(
      id: '12',
      name: 'Phòng Tổng Thống',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L2',
    ),
    TourSpot(
      id: '13',
      name: 'Phòng Chiếu Phim',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L3',
    ),
    TourSpot(
      id: '14',
      name: 'Sân Thượng',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L3',
    ),
    TourSpot(
      id: '15',
      name: 'Phòng Trưng Bày',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L4',
    ),

    // ── Tour 3: Khu triển lãm ngoài trời ──
    TourSpot(
      id: '16',
      name: 'Khu Triển Lãm 1',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'EX1',
    ),
    TourSpot(
      id: '17',
      name: 'Khu Triển Lãm Xe Tăng',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'EX1',
    ),
    TourSpot(
      id: '18',
      name: 'Khu Triển Lãm 2',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'EX2',
    ),
    TourSpot(
      id: '19',
      name: 'Phòng Cố Vấn',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L1',
    ),
    TourSpot(
      id: '21',
      name: 'Phòng Đại Sứ',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L1',
    ),
    TourSpot(
      id: '32',
      name: 'Khu Lễ Tân',
      imagePath: 'assets/images/dinhdoclap.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'ground',
    ),
    TourSpot(
      id: '35',
      name: 'Ban Công Chính',
      imagePath: 'assets/images/nhatrienlam.jpg',
      audioPath: 'assets/audio/00_history.mp3',
      floor: 'L1',
    ),
  ];

  // ══════════════════════════════════════
  // Các Tour (nhóm các điểm tham quan)
  // ══════════════════════════════════════

  static const List<Tour> tours = [
    Tour(
      id: '0',
      name: 'Dinh Độc Lập',
      description: 'Dinh Độc Lập không chỉ là một công trình thông thường, mà là một bản hùng ca '
          'được dệt nên bằng gạch và thép ngay giữa lòng Sài Gòn. Hãy quên đi những gì '
          'bạn từng đọc trong sách vở, và thử tưởng tượng bạn đang bước vào một mê cung '
          'của quyền lực, nơi định đoạt vận mệnh lịch sử. Từ cánh cổng sắt đến những hành '
          'lang tĩnh lặng, dinh thự này toát lên một bầu không khí uy nghiêm và bí ẩn. '
          'Mỗi căn phòng, mỗi hiện vật đều kể lại một câu chuyện riêng, từ chiếc xe tăng '
          'húc đổ cổng chính vào ngày 30 tháng 4 năm 1975 cho đến mạng lưới hầm trú ẩn '
          'bí mật kiên cố dưới lòng đất. Nơi đây khơi gợi lại những thời khắc hào hùng, '
          'những giây phút nín thở, giúp ta cảm nhận sức nặng của thời gian và ý nghĩa '
          'thiêng liêng của hai chữ "Độc Lập". Khi đứng trên ban công và phóng tầm mắt '
          'ra bãi cỏ rợp bóng mát, bạn sẽ cảm nhận được linh hồn kiêu hãnh của Sài Gòn '
          'đang tuôn chảy cùng dòng thác lịch sử...',
      imagePath: 'assets/images/background.jpg',
      spots: [
        TourSpot(id: '00', name: 'Dinh Độc Lập', imagePath: 'assets/images/background.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'bunker'),
        TourSpot(id: '01', name: 'Phòng Họp Nội Các', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'bunker'),
        TourSpot(id: '02', name: 'Hầm Bí Mật', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'bunker'),
        TourSpot(id: '03', name: 'Phòng Thông Tin', imagePath: 'assets/images/background.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'bunker'),
        TourSpot(id: '04', name: 'Phòng Chỉ Huy', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'bunker'),
      ],
    ),
    Tour(
      id: '1',
      name: 'Tòa nhà Triển lãm',
      description: 'Tòa nhà Triển lãm là nơi trưng bày các hiện vật lịch sử và văn hóa của Việt Nam.',
      imagePath: 'assets/images/nhatrienlam.jpg',
      spots: [
        TourSpot(id: '07', name: 'Sảnh Chính', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'ground'),
        TourSpot(id: '08', name: 'Khu Vườn', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'ground'),
        TourSpot(id: '09', name: 'Đài Phun Nước', imagePath: 'assets/images/background.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'ground'),
        TourSpot(id: '10', name: 'Phòng Khách Nhà Nước', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L2'),
        TourSpot(id: '11', name: 'Phòng Tiệc', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L2'),
      ],
    ),
    Tour(
      id: '2',
      name: 'Khu vực tầng trên',
      description: 'Khu vực tầng trên là nơi trưng bày các hiện vật lịch sử và văn hóa của Việt Nam.',  
      imagePath: 'assets/images/dinhdoclap.jpg',
      spots: [
        TourSpot(id: '12', name: 'Phòng Tổng Thống', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L2'),
        TourSpot(id: '13', name: 'Phòng Chiếu Phim', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L3'),
        TourSpot(id: '14', name: 'Sân Thượng', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L3'),
        TourSpot(id: '15', name: 'Phòng Trưng Bày', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L4'),
        TourSpot(id: '19', name: 'Phòng Cố Vấn', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L1'),
        TourSpot(id: '21', name: 'Phòng Đại Sứ', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L1'),
        TourSpot(id: '35', name: 'Ban Công Chính', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'L1'),
      ],
    ),
    Tour(
      id: '3',
      name: 'Khu Triển lãm ngoài trời',
      description: 'Khu vực tầng trên là nơi trưng bày các hiện vật lịch sử và văn hóa của Việt Nam.',
      imagePath: 'assets/images/nhatrienlam.jpg',
      spots: [
        TourSpot(id: '16', name: 'Khu Triển Lãm 1', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'EX1'),
        TourSpot(id: '17', name: 'Khu Triển Lãm Xe Tăng', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'EX1'),
        TourSpot(id: '18', name: 'Khu Triển Lãm 2', imagePath: 'assets/images/nhatrienlam.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'EX2'),
        TourSpot(id: '32', name: 'Khu Lễ Tân', imagePath: 'assets/images/dinhdoclap.jpg', audioPath: 'assets/audio/00_history.mp3', floor: 'ground'),
      ],
    ),
  ];

  static TourSpot? findById(String id) {
    final padded = id.padLeft(2, '0');
    for (final tour in tours) {
      for (final spot in tour.spots) {
        if (spot.id == id || spot.id == padded) return spot;
      }
    }
    return null;
  }
}
