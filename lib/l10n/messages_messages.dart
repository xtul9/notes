// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
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
  String get localeName => 'messages';

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'appTitle': MessageLookupByLibrary.simpleMessage('Notes'),
    'cancel': MessageLookupByLibrary.simpleMessage('Cancel'),
    'clearNotes': MessageLookupByLibrary.simpleMessage('Clear notes'),
    'confirmDelete': MessageLookupByLibrary.simpleMessage('Are you sure you want to delete this note?'),
    'confirmDeleteAllNotes': MessageLookupByLibrary.simpleMessage('Are you sure you want to delete all notes?'),
    'delete': MessageLookupByLibrary.simpleMessage('Delete'),
    'deleteNote': MessageLookupByLibrary.simpleMessage('Delete note'),
    'email': MessageLookupByLibrary.simpleMessage('Email'),
    'emailInUse': MessageLookupByLibrary.simpleMessage('This email is already in use.'),
    'enterNote': MessageLookupByLibrary.simpleMessage('Enter note'),
    'failedClearingNotes': MessageLookupByLibrary.simpleMessage('Could not clear notes.'),
    'failedDeletingNote': MessageLookupByLibrary.simpleMessage('Could not delete this note.'),
    'failedFetchingNotes': MessageLookupByLibrary.simpleMessage('Failed fetching notes.'),
    'failedLogin': MessageLookupByLibrary.simpleMessage('Login failed. Please check your email and password. Make sure you verified your email!'),
    'failedSavingNote': MessageLookupByLibrary.simpleMessage('Could not save this note.'),
    'login': MessageLookupByLibrary.simpleMessage('Login'),
    'loginAction': MessageLookupByLibrary.simpleMessage('Login'),
    'noteLengthExceeded': MessageLookupByLibrary.simpleMessage('Note length exceeds the limit of 2000 characters.'),
    'notes': MessageLookupByLibrary.simpleMessage('Notes'),
    'ok': MessageLookupByLibrary.simpleMessage('OK'),
    'password': MessageLookupByLibrary.simpleMessage('Password'),
    'passwordTooShort': MessageLookupByLibrary.simpleMessage('The password should have at least 6 characters.'),
    'register': MessageLookupByLibrary.simpleMessage('Register'),
    'registerAction': MessageLookupByLibrary.simpleMessage('Register'),
    'registerError': MessageLookupByLibrary.simpleMessage('Unable to register. Try again in few minutes.'),
    'tooManyNotes': MessageLookupByLibrary.simpleMessage('You can only have 10 notes. (I\'m on a free plan dude)'),
    'verificationEmailSent': MessageLookupByLibrary.simpleMessage('Verification Email Sent'),
    'verificationEmailSentContent': MessageLookupByLibrary.simpleMessage('A verification email has been sent to your email. Please check your inbox and follow the instructions to verify your account.')
  };
}
