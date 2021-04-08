import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {
  Locale locale;

  AppLocale(this.locale);

  Map<String, String> _loadedLocalizedValue;

  static AppLocale of(BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  Future lanLoad() async {
    String _langFile =
        await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
    Map<String, dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValue =
        _loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslated(String key) {
    return _loadedLocalizedValue[key];
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocaleDelegate();
}

class _AppLocaleDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocaleDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale);
    await appLocale.lanLoad();
    return appLocale;
  }

  @override
  bool shouldReload(_AppLocaleDelegate old) => false;
}
