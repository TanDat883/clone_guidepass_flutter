import 'package:flutter/material.dart';
import 'package:clone_guidepass/config/app_theme.dart';
import 'package:clone_guidepass/data/language_data.dart';
import 'package:clone_guidepass/models/language.dart';

/// Hiển thị dialog chọn ngôn ngữ
void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const LanguageDialog(),
  );
}

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = LanguageData.supportedLanguages;

    return Dialog(
      backgroundColor: AppTheme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingLG),
            child: Text(
              'Chọn ngôn ngữ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Divider(height: 1),
          // Language list
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: languages.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return _LanguageTile(
                  language: languages[index],
                  onTap: () {
                    Navigator.pop(context, languages[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final Language language;
  final VoidCallback? onTap;

  const _LanguageTile({
    required this.language,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppTheme.bgLight,
        ),
        child: Center(
          child: Text(
            _getFlagEmoji(language.code),
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
      title: Text(
        language.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.textDark,
        ),
      ),
      onTap: onTap,
    );
  }

  /// Convert language code to emoji flag
  String _getFlagEmoji(String code) {
    switch (code) {
      case 'zh':
        return '🇨🇳';
      case 'en':
        return '🇬🇧';
      case 'fr':
        return '🇫🇷';
      case 'de':
        return '🇩🇪';
      case 'ja':
        return '🇯🇵';
      case 'vi':
        return '🇻🇳';
      case 'ko':
        return '🇰🇷';
      case 'es':
        return '🇪🇸';
      case 'th':
        return '🇹🇭';
      case 'km':
        return '🇰🇭';
      default:
        return '🏳️';
    }
  }
}
