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

  String get failedClearingNotes {
    return Intl.message(
      'Could not clear notes.',
      name: 'failedClearingNotes',
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
      'Login failed. Please check your email and password. Make sure you verified your email!',
      name: 'failedLogin',
    );
  }

  String get loginAction {
    return Intl.message(
      'Login',
      name: 'loginAction',
    );
  }

  String get confirmDelete {
    return Intl.message(
      'Are you sure you want to delete this note?',
      name: 'confirmDelete',
    );
  }

  String get confirmDeleteAllNotes {
    return Intl.message(
      'Are you sure you want to delete all notes?',
      name: 'confirmDeleteAllNotes',
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
    );
  }

  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
    );
  }

  String get register {
    return Intl.message(
      'Register',
      name: 'register',
    );
  }

  String get registerAction {
    return Intl.message(
      'Register',
      name: 'registerAction',
    );
  }

  String get passwordTooShort {
    return Intl.message(
      'The password should have at least 6 characters.',
      name: 'passwordTooShort',
    );
  }

  String get emailInUse {
    return Intl.message(
      'This email is already in use.',
      name: 'emailInUse',
    );
  }

  String get registerError {
    return Intl.message(
      'Unable to register. Try again in few minutes.',
      name: 'registerError',
    );
  }

  String get verificationEmailSent {
    return Intl.message(
      'Verification Email Sent',
      name: 'verificationEmailSent',
    );
  }

  String get verificationEmailSentContent {
    return Intl.message(
      'A verification email has been sent to your email. Please check your inbox and follow the instructions to verify your account.',
      name: 'verificationEmailSentContent',
    );
  }

  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
    );
  }

  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
    );
  }

  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutConfirmation',
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
