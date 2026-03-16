import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';

class BottomActionBar extends StatelessWidget {
  final VoidCallback? onDownloadPressed;
  final VoidCallback? onStartTourPressed;

  const BottomActionBar({
    super.key,
    this.onDownloadPressed,
    this.onStartTourPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacingLG),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppTheme.white,
              const Color.fromRGBO(255, 255, 255, 0.9),
              const Color.fromRGBO(255, 255, 255, 0.0),
            ],
          ),
        ),
        child: Row(
          children: [
            // Nút "Tiếp tục tải xuống"
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: onDownloadPressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.download, size: 22),
                      const SizedBox(width: AppTheme.spacingSM),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Tiếp tục",
                            style: TextStyle(fontSize: 13, height: 1.2),
                          ),
                          Text(
                            "tải xuống",
                            style: TextStyle(fontSize: 13, height: 1.2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Nút "Bắt đầu tour"
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: onStartTourPressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.play_circle_outline, size: 24),
                      SizedBox(width: AppTheme.spacingSM),
                      Text(
                        "Bắt đầu tour",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
