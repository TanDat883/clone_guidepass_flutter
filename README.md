lib/
├── core/                               # NỀN TẢNG (Dùng chung toàn app)
│   ├── constants/
│   │   ├── app_assets.dart             # Đường dẫn hình ảnh, icon, file Rive/Lottie
│   │   ├── app_colors.dart             # Bảng màu chuẩn (Đỏ chủ đạo, xám, trắng...)
│   │   └── app_dimens.dart             # Kích thước chuẩn (padding, margin, radius)
│   ├── services/                       # CÁC DỊCH VỤ CỐT LÕI (Rất quan trọng cho app này)
│   │   ├── audio_player_service.dart   # Xử lý phát/dừng/tua audio thuyết minh (dùng just_audio)
│   │   └── local_storage_service.dart  # Xử lý lưu trữ file audio tải xuống để nghe offline
│   ├── utils/
│   │   ├── time_formatter.dart         # Format thời gian audio (vd: 01:20)
│   │   └── map_calculator.dart         # Xử lý tọa độ x,y để render ghim (pin) trên bản đồ
│   └── shared_widgets/
│       ├── custom_audio_player.dart    # Thanh player (Play/Pause/Tiến độ) dùng lại nhiều nơi
│       └── custom_app_bar.dart         # AppBar chứa nút đổi ngôn ngữ
│
├── l10n/                               # ĐA NGÔN NGỮ (Trái tim của app du lịch)
│   ├── app_en.arb
│   ├── app_vi.arb
│   └── app_zh.arb                      # ... (Thêm các ngôn ngữ khác theo yêu cầu)
│
├── features/                           # TÍNH NĂNG (Chia theo module nghiệp vụ)
│   ├── onboarding/                     # 1. Khởi động & Cài đặt ban đầu
│   │   ├── presentation/
│   │   │   ├── screens/welcome_screen.dart
│   │   │   └── widgets/language_selector_bottom_sheet.dart
│   │   └── application/                # Chứa Bloc/Cubit quản lý state chọn ngôn ngữ
│   │
│   ├── map/                            # 2. Bản đồ tương tác
│   │   ├── data/
│   │   │   └── models/map_point_model.dart  # Tọa độ và ID của các điểm (00, 107...)
│   │   ├── presentation/
│   │   │   ├── screens/map_screen.dart
│   │   │   └── widgets/
│   │   │       ├── interactive_floor_plan.dart # Xử lý zoom/pan bản đồ
│   │   │       ├── map_pin_marker.dart         # Nút tròn đỏ đánh số
│   │   │       └── numpad_search_widget.dart   # Bàn phím số để nhập ID điểm tham quan
│   │   └── application/
│   │       └── map_bloc.dart                   # Quản lý state tầng hiện tại, điểm đang chọn
│   │
│   └── poi/                            # 3. Điểm tham quan (Point of Interest)
│       ├── data/
│       │   ├── repositories/poi_repository_impl.dart
│       │   └── data_sources/poi_local_data_source.dart # Đọc data từ file JSON (nếu app offline)
│       ├── domain/
│       │   ├── entities/poi_entity.dart        # id, title, description, audioUrl, imageUrl
│       │   └── repositories/poi_repository.dart
│       └── presentation/
│           ├── screens/
│           │   ├── poi_list_screen.dart        # Màn hình "Mục lục"
│           │   └── poi_detail_screen.dart      # Màn hình chi tiết chứa Audio & Text
│           └── application/
│               └── poi_detail_bloc.dart        # Quản lý trạng thái đang tải audio, đang phát...
│
├── config/                             # CẤU HÌNH 
│   ├── router.dart                     # Cấu hình GoRouter (điều hướng bằng path)
│   └── service_locator.dart            # Thiết lập GetIt (Dependency Injection)
│
└── main.dart                           # Entry point