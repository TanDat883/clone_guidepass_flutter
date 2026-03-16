import 'package:clone_guidepass/models/language.dart';

class LanguageData {
  LanguageData._();

  static const List<Language> supportedLanguages = [
    Language(code: 'zh', name: 'Chinese'),
    Language(code: 'en', name: 'English'),
    Language(code: 'fr', name: 'French'),
    Language(code: 'de', name: 'German'),
    Language(code: 'ja', name: 'Japanese'),
    Language(code: 'vi', name: 'Vietnamese'),
    Language(code: 'ko', name: 'Korean'),
    Language(code: 'es', name: 'Spanish'),
    Language(code: 'th', name: 'Thailand'),
    Language(code: 'km', name: 'Cambodia'),
  ];
}
