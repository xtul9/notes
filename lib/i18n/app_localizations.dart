import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class AppLocalizations {
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get failedFetchingNotes {
    return Intl.message(
      'Failed fetching notes.',
      name: 'failedFetchingNotes',
    );
  }

  // Add the delegate
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Add your supported languages here
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    // AppLocalizations class will do the work of loading the localized values
    return SynchronousFuture<AppLocalizations>(AppLocalizations());
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
