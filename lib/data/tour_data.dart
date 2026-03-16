import 'package:clone_guidepass/models/tour_spot.dart';

class TourData {
  TourData._();

  static const List<TourSpot> spots = [
    TourSpot(
      id: '0',
      name: 'Dinh Độc Lập',
      description:
          'Dinh Độc Lập không chỉ là một công trình thông thường, mà là một bản hùng ca '
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
    ),
    TourSpot(
      id: '1',
      name: 'Tòa nhà Triển lãm',
      description:
          'Tòa nhà Triển lãm nằm trong khuôn viên Dinh Độc Lập, là nơi trưng bày '
          'nhiều hiện vật lịch sử quý giá liên quan đến quá trình xây dựng và phát triển '
          'của Dinh qua các thời kỳ.',
      imagePath: 'assets/images/nhatrienlam.jpg',
    ),
  ];
}
