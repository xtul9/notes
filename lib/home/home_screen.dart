import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth.dart';
import 'package:flutter_application_1/error/error_snack.dart';
import 'package:flutter_application_1/firestore/data_access.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';

import '../model/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Note> _notes = [];
  final noteController = TextEditingController();
  final _dataAccess = DataAccess();
  final userId = auth.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    _downloadNotes();
  }

  void onError(String message) {
    ErrorSnack.show(context, message);
  }

  void _showConfirmationDialog(
      String title, String content, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(AppLocalizations.of(context)!.delete),
            ),
          ],
        );
      },
    );
  }

  Future<void> _downloadNotes() async {
    final notes = await _dataAccess.getNotesFromFirestore(userId,
        () => onError(AppLocalizations.of(context)!.failedFetchingNotes));

    for (var doc in notes.docs) {
      setState(() {
        _notes.add(Note(
            document: doc.id,
            content: doc['content'],
            userId: userId,
            order: doc['order'] ?? 0));
      });
    }
  }

  void _addNote(String content) {
    if (content.length > 2000) {
      ErrorSnack.show(
          context, AppLocalizations.of(context)!.noteLengthExceeded);
      return;
    }

    if (_notes.length >= 10) {
      ErrorSnack.show(context, AppLocalizations.of(context)!.tooManyNotes);
      return;
    }

    Note note = Note(
      document: '',
      content: content,
      userId: auth.currentUser!.uid,
      order: _notes.length,
    );

    if (note.content.isNotEmpty && !_notes.contains(note)) {
      successCallback(newNote) => {
            setState(() {
              _notes.add(newNote);
              noteController.clear();
            })
          };

      failureCallback() => {
            ErrorSnack.show(
                context, AppLocalizations.of(context)!.failedSavingNote)
          };

      _dataAccess.addNoteToFirestore(
          note, userId, successCallback, failureCallback);
    }
  }

  void _clearNotes() {
    onClearError() => onError(AppLocalizations.of(context)!.failedDeletingNote);

    onConfirm() async {
      final notes =
          await _dataAccess.getNotesFromFirestore(userId, onClearError);
      await _dataAccess.clearNotesFromFirestore(notes.docs, onClearError);

      setState(() {
        _notes.clear();
      });

      if (mounted) {
        Navigator.of(context).pop();
      }
    }

    _showConfirmationDialog(AppLocalizations.of(context)!.delete,
        AppLocalizations.of(context)!.confirmDeleteAllNotes, onConfirm);
  }

  void _removeNote(int index) {
    onConfirm() {
      _dataAccess.deleteNoteFromFirestore(_notes[index].document!,
          () => onError(AppLocalizations.of(context)!.failedDeletingNote));
      setState(() {
        _notes.removeAt(index);
      });
      Navigator.of(context).pop();
    }

    _showConfirmationDialog(
      AppLocalizations.of(context)!.delete,
      AppLocalizations.of(context)!.confirmDelete,
      onConfirm,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(AppLocalizations.of(context)!.notes),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearNotes,
            tooltip: AppLocalizations.of(context)!.clearNotes,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index].content),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeNote(index),
                  ),
                );
              },
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: noteController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.enterNote,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _addNote(noteController.text),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
