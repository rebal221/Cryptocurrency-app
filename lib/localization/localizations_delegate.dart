import 'package:flutter/material.dart';
import 'package:mining_sett/localization/language/language_ar.dart';
import 'package:mining_sett/localization/language/language_en.dart';

import 'language/language_cn.dart';
import 'language/language_es.dart';
import 'language/language_fr.dart';
import 'language/language_pt.dart';
import 'language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'pt', 'zh', 'es', 'fr'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'ar':
        return LanguageAr();
      case 'zh':
        return LanguageCn();
      case 'fr':
        return LanguageFr();
      case 'es':
        return LanguageEs();
      case 'pt':
        return LanguagePt();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
