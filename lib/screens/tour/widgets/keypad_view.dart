import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/data/tour_data.dart';
import 'package:clone_guidepass/screens/tour/poi_detail_screen.dart';

class KeypadView extends StatefulWidget {
  const KeypadView({super.key});

  @override
  State<KeypadView> createState() => _KeypadViewState();
}

class _KeypadViewState extends State<KeypadView> {
  String _inputCode = '';
  bool _showError = false;

  void _onKeyPress(String key) {
    setState(() {
      _inputCode += key;
      _showError = false;
    });
  }

  void _onBackspace() {
    if (_inputCode.isNotEmpty) {
      setState(() {
        _inputCode = _inputCode.substring(0, _inputCode.length - 1);
        _showError = false;
      });
    }
  }

  void _onOk() {
    if (_inputCode.isEmpty) return;

    final spot = TourData.findById(_inputCode);
    if (spot != null) {
      // Navigate to the POI detail screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PoiDetailScreen(spot: spot),
        ),
      );
      // Clear input after navigation
      setState(() {
        _inputCode = '';
        _showError = false;
      });
    } else {
      // Show error feedback
      setState(() {
        _showError = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không tìm thấy điểm tham quan mã: $_inputCode'),
          backgroundColor: AppTheme.primaryRed,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Input Display ──
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          margin: const EdgeInsets.all(AppTheme.spacingLG),
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMD,
            vertical: AppTheme.spacingXL,
          ),
          decoration: BoxDecoration(
            color: _showError
                ? const Color(0xFFFFEBEE)
                : AppTheme.primaryRed.withAlpha(25),
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            border: _showError
                ? Border.all(color: AppTheme.primaryRed, width: 1.5)
                : null,
          ),
          child: Column(
            children: [
              Text(
                _inputCode.isEmpty
                    ? 'Nhập mã số điểm tham quan'
                    : _inputCode,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _inputCode.isEmpty ? 16 : 28,
                  fontWeight:
                      _inputCode.isEmpty ? FontWeight.w400 : FontWeight.bold,
                  color: _showError
                      ? AppTheme.primaryRed
                      : (_inputCode.isEmpty
                          ? AppTheme.primaryRed.withAlpha(150)
                          : AppTheme.primaryRed),
                  letterSpacing: _inputCode.isEmpty ? 0 : 8,
                ),
              ),
              if (_showError) ...[
                const SizedBox(height: 8),
                const Text(
                  'Không tìm thấy. Vui lòng thử lại.',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.primaryRed,
                  ),
                ),
              ],
            ],
          ),
        ),

        const Spacer(),

        // ── Number Pad ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              _buildKeyRow(['1', '2', '3']),
              const SizedBox(height: AppTheme.spacingSM),
              _buildKeyRow(['4', '5', '6']),
              const SizedBox(height: AppTheme.spacingSM),
              _buildKeyRow(['7', '8', '9']),
              const SizedBox(height: AppTheme.spacingSM),
              Row(
                children: [
                  // Empty space
                  Expanded(child: const SizedBox()),
                  const SizedBox(width: AppTheme.spacingSM),
                  // 0
                  Expanded(child: _buildKeyButton('0')),
                  const SizedBox(width: AppTheme.spacingSM),
                  // Backspace
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.backspace_outlined,
                      onPressed: _onBackspace,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppTheme.spacingLG),

        // ── OK Button ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _inputCode.isNotEmpty ? _onOk : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _inputCode.isNotEmpty
                    ? AppTheme.primaryRed
                    : Colors.grey[300],
                foregroundColor: AppTheme.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                ),
                elevation: _inputCode.isNotEmpty ? 2 : 0,
              ),
              child: const Text(
                'Ok',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        const Spacer(flex: 1),
      ],
    );
  }

  Widget _buildKeyRow(List<String> keys) {
    return Row(
      children: keys.asMap().entries.map((entry) {
        final index = entry.key;
        final key = entry.value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : AppTheme.spacingSM / 2,
              right: index == keys.length - 1 ? 0 : AppTheme.spacingSM / 2,
            ),
            child: _buildKeyButton(key),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKeyButton(String label) {
    return Material(
      color: AppTheme.white,
      borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      elevation: 2,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        onTap: () => _onKeyPress(label),
        child: Container(
          height: 56,
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppTheme.textDark,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: const Color(0xFFE0E0E0),
      borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      elevation: 2,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        onTap: onPressed,
        child: Container(
          height: 56,
          alignment: Alignment.center,
          child: Icon(icon, size: 24, color: AppTheme.textDark),
        ),
      ),
    );
  }
}
