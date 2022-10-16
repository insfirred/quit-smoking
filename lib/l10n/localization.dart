import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'package:i_can/l10n/localization_de.dart';
import 'package:i_can/l10n/localization_en.dart';

abstract class Localization {
  static Localization? of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  String get hours;
  String get minutes;
  String get seconds;
  String get no_smoking;
  String get cigarettes_avoided;
  String get you_are_strong;
  String get money_saved;
  String get currency;
  String get life_saved;
  String get good_evening;
  String get glad_to_see;
  String get what_should_i_call_you;
  String get your_name;
  String get since_when;
  String get choose_date;
  String get next;
  String get january;
  String get february;
  String get march;
  String get april;
  String get may;
  String get june;
  String get july;
  String get august;
  String get september;
  String get october;
  String get november;
  String get december;
  String get how_many_cigarettes_pack;
  String get how_many_cigarettes_daily;
  String get how_much_costs;
  String get i_can_and_will;
}

class QuitSmokeLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const QuitSmokeLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'de'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    if (locale.languageCode == 'en') {
      return LocalizationEN();
    }
    return LocalizationDE();
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}
