import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/constants.dart';

abstract interface class LocaleRepository {
  const LocaleRepository();

  String getLocale();
  Future<void> setLocale(String locale);
}

final class LocaleRepositoryImpl implements LocaleRepository {
  LocaleRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  String getLocale() {
    final code = PlatformDispatcher.instance.locale.languageCode;
    return _prefs.getString(Keys.locale) ??
        (Locales.codes.contains(code) ? code : Locales.en);
  }

  @override
  Future<void> setLocale(String locale) async {
    await _prefs.setString(Keys.locale, locale);
  }
}
