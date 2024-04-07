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
      'clearNotes': MessageLookupByLibrary.simpleMessage('Wyczyść notatki'),
    'deleteNote': MessageLookupByLibrary.simpleMessage('Usuń notatkę'),
    'email': MessageLookupByLibrary.simpleMessage('Email'),
    'enterNote': MessageLookupByLibrary.simpleMessage('Wprowadź notatkę'),
    'failedDeletingNote': MessageLookupByLibrary.simpleMessage('Nie udało się usunąć tej notatki.'),
    'failedFetchingNotes': MessageLookupByLibrary.simpleMessage('Nie udało się pobrać notatek.'),
    'failedLogin': MessageLookupByLibrary.simpleMessage('Logowanie nie powiodło się. Sprawdź swój email i hasło.'),
    'failedSavingNote': MessageLookupByLibrary.simpleMessage('Nie udało się zapisać tej notatki.'),
    'login': MessageLookupByLibrary.simpleMessage('Zaloguj się'),
    'loginAction': MessageLookupByLibrary.simpleMessage('Zaloguj się'),
    'noteLengthExceeded': MessageLookupByLibrary.simpleMessage('Długość notatki przekracza limit 2000 znaków.'),
    'notes': MessageLookupByLibrary.simpleMessage('Notatki'),
    'password': MessageLookupByLibrary.simpleMessage('Hasło'),
    'tooManyNotes': MessageLookupByLibrary.simpleMessage('Możesz mieć tylko 10 notatek. (używam darmowego planu mordeczko)')
  };
}
