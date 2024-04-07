// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
// messages from the main program should be duplicated here with the same
// function name.
// @dart=2.12
// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'pl';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'appTitle': MessageLookupByLibrary.simpleMessage('Notatki'),
    'cancel': MessageLookupByLibrary.simpleMessage('Anuluj'),
    'clearNotes': MessageLookupByLibrary.simpleMessage('Wyczyść notatki'),
    'confirmDelete': MessageLookupByLibrary.simpleMessage('Czy na pewno chcesz usunąć tę notatkę?'),
    'confirmDeleteAllNotes': MessageLookupByLibrary.simpleMessage('Czy na pewno chcesz usunąć wszystkie notatki?'),
    'continueButton': MessageLookupByLibrary.simpleMessage('Kontynuuj'),
    'delete': MessageLookupByLibrary.simpleMessage('Usuń'),
    'deleteNote': MessageLookupByLibrary.simpleMessage('Usuń notatkę'),
    'email': MessageLookupByLibrary.simpleMessage('Email'),
    'emailInUse': MessageLookupByLibrary.simpleMessage('Ten email jest już używany.'),
    'enterNote': MessageLookupByLibrary.simpleMessage('Wprowadź notatkę'),
    'failedClearingNotes': MessageLookupByLibrary.simpleMessage('Nie udało się wyczyścić notatek.'),
    'failedDeletingNote': MessageLookupByLibrary.simpleMessage('Nie udało się usunąć tej notatki.'),
    'failedFetchingNotes': MessageLookupByLibrary.simpleMessage('Nie udało się pobrać notatek.'),
    'failedLogin': MessageLookupByLibrary.simpleMessage('Logowanie nie powiodło się. Sprawdź swój email i hasło. Upewnij się, że zweryfikowałeś email!'),
    'failedSavingNote': MessageLookupByLibrary.simpleMessage('Nie udało się zapisać tej notatki.'),
    'login': MessageLookupByLibrary.simpleMessage('Login'),
    'loginAction': MessageLookupByLibrary.simpleMessage('Zaloguj się'),
    'logout': MessageLookupByLibrary.simpleMessage('Wyloguj się'),
    'logoutConfirmation': MessageLookupByLibrary.simpleMessage('Na pewno chcesz się wylogować?'),
    'noteLengthExceeded': MessageLookupByLibrary.simpleMessage('Długość notatki przekracza limit 2000 znaków.'),
    'notes': MessageLookupByLibrary.simpleMessage('Notatki'),
    'ok': MessageLookupByLibrary.simpleMessage('OK'),
    'password': MessageLookupByLibrary.simpleMessage('Hasło'),
    'passwordTooShort': MessageLookupByLibrary.simpleMessage('Hasło powinno mieć co najmniej 6 znaków.'),
    'register': MessageLookupByLibrary.simpleMessage('Rejestracja'),
    'registerAction': MessageLookupByLibrary.simpleMessage('Zarejestruj się'),
    'registerError': MessageLookupByLibrary.simpleMessage('Nie można się zarejestrować. Spróbuj ponownie za kilka minut.'),
    'tooManyNotes': MessageLookupByLibrary.simpleMessage('Możesz mieć tylko 10 notatek. (używam darmowego planu mordeczko)'),
    'verificationEmailSent': MessageLookupByLibrary.simpleMessage('Wysłano Email Weryfikacyjny'),
    'verificationEmailSentContent': MessageLookupByLibrary.simpleMessage('Wysłaliśmy email weryfikacyjny na twój email. Sprawdź swoją skrzynkę odbiorczą i podążaj za instrukcjami, by zweryfikować konto.')
  };
}
