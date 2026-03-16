import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';

class KeypadView extends StatefulWidget {
  const KeypadView({super.key});

  @override
  State<KeypadView> createState() => _KeypadViewState();
}

class _KeypadViewState extends State<KeypadView> {
  String _inputCode = '';

  void _onKeyPress(String key) {
    setState(() {
      _inputCode += key;
    });
  }

  void _onBackspace() {
    if (_inputCode.isNotEmpty) {
      setState(() {
        _inputCode = _inputCode.substring(0, _inputCode.length - 1);
      });
    }
  }

  void _onOk() {
    if (_inputCode.isNotEmpty) {
      // TODO: Handle keycode lookup
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tìm kiếm mã: $_inputCode')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Input Display ──
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(AppTheme.spacingLG),
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMD,
            vertical: AppTheme.spacingXL,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primaryRed.withAlpha(25),
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          ),
          child: Text(
            _inputCode.isEmpty
                ? 'Enter the keycode of the content you want to see'
                : _inputCode,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: _inputCode.isEmpty ? 16 : 28,
              fontWeight:
                  _inputCode.isEmpty ? FontWeight.w400 : FontWeight.bold,
              color: _inputCode.isEmpty
                  ? AppTheme.primaryRed.withAlpha(150)
                  : AppTheme.primaryRed,
              letterSpacing: _inputCode.isEmpty ? 0 : 8,
            ),
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
            child: TextButton(
              onPressed: _onOk,
              child: const Text(
                'Ok',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
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
