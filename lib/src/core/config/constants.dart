import 'dart:ui';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract final class AppColors {
  static const main = Color(0xff69F0AE);
  static const accent = Color(0xffFF5252);
}

abstract final class AppFonts {
  static const w400 = 'w400';
  static const w500 = 'w500';
  static const w600 = 'w600';
  static const w700 = 'w700';
  static const w800 = 'w800';
}

abstract final class Assets {
  static const tab1 = 'assets/tab1.svg';
}

abstract final class Keys {
  static const onboard = 'onboard';
  static const locale = 'locale';
}

abstract final class Locales {
  static const en = 'en';
  static const ru = 'ru';
  static const List<String> codes = [
    Locales.en,
    Locales.ru,
  ];
}

abstract final class Tables {
  static const todos = 'todos';
}

abstract final class SQL {
  static const todos = '''
    CREATE TABLE IF NOT EXISTS ${Tables.todos} (
      id INTEGER,
      photo TEXT
    )
    ''';
}
