## 📁 Cấu trúc thư mục 

```text
lib/
├── config/           # Cấu hình chung của ứng dụng (Routes, Theme)
│   ├── app_routes.dart
│   └── app_theme.dart
├── data/             # Nguồn dữ liệu tĩnh (Mock data) cho bản đồ, ngôn ngữ, và tour
│   ├── language_data.dart
│   ├── map_data.dart
│   └── tour_data.dart
├── models/           # Các lớp mô phỏng dữ liệu (Data models)
│   ├── language.dart
│   ├── map_point.dart
│   ├── tour.dart
│   └── tour_spot.dart
├── screens/          # Các màn hình chính, phân chia theo tính năng (Feature-based)
│   ├── home/         # Màn hình trang chủ và các widgets liên quan
│   ├── tour/         # Màn hình chi tiết tour, bản đồ tương tác (Map View), điểm dừng (POI)
│   └── welcome/      # Màn hình chào mừng/Onboarding
├── widgets/          # Các UI components dùng chung trên toàn hệ thống (Shared widgets)
└── main.dart         # Entry point của ứng dụng