// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:bm_mobile/locale/LanguageEn.dart';
import 'package:bm_mobile/locale/LanguageFr.dart';
import 'package:bm_mobile/locale/Languages.dart';

import 'LanguageAr.dart';
import 'LanguageHi.dart';

class AppLocalizations extends LocalizationsDelegate<BaseLanguage> {
  const AppLocalizations();

  @override
  Future<BaseLanguage> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'ar':
        return LanguageAr();
      case 'hi':
        return LanguageHi();
      case 'fr':
        return LanguageFr();
      default:
        return LanguageEn();
    }
  }

  @override
  bool isSupported(Locale locale) =>
      LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<BaseLanguage> old) => false;
}
