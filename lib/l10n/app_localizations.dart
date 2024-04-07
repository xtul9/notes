import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'messages_all_locales.dart';

class AppLocalizations {
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appTitle {
    return Intl.message(
      'Notes',
      name: 'appTitle',
    );
  }

  String get failedFetchingNotes {
    return Intl.message(
      'Failed fetching notes.',
      name: 'failedFetchingNotes',
    );
  }

  String get noteLengthExceeded {
    return Intl.message(
      'Note length exceeds the limit of 2000 characters.',
      name: 'noteLengthExceeded',
    );
  }

  String get tooManyNotes {
    return Intl.message(
      'You can only have 10 notes. (I\'m on a free plan dude)',
      name: 'tooManyNotes',
    );
  }

  String get failedSavingNote {
    return Intl.message(
      'Could not save this note.',
      name: 'failedSavingNote',
    );
  }

  String get failedDeletingNote {
    return Intl.message(
      'Could not delete this note.',
      name: 'failedDeletingNote',
    );
  }

  String get clearNotes {
    return Intl.message(
      'Clear notes',
      name: 'clearNotes',
    );
  }

  String get deleteNote {
    return Intl.message(
      'Delete note',
      name: 'deleteNote',
    );
  }

  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
    );
  }

  String get enterNote {
    return Intl.message(
      'Enter note',
      name: 'enterNote',
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
    );
  }

  String get password {
    return Intl.message(
      'Password',
      name: 'password',
    );
  }

  String get failedLogin {
    return Intl.message(
      'Login failed. Please check your email and password.',
      name: 'failedLogin',
    );
  }

  String get loginAction {
    return Intl.message(
      'Login',
      name: 'loginAction',
    );
  }

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'pl'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
