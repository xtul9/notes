import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth.dart';
import 'package:flutter_application_1/firestore/data_access.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';

import '../model/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note> _notes = [];
  final noteController = TextEditingController();
  final _dataAccess = DataAccess();
  final userId = auth.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    _downloadNotes();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Future<void> _downloadNotes() async {
    onError() =>
        {_showSnackBar(AppLocalizations.of(context)!.failedFetchingNotes)};

    final notes = await _dataAccess.getNotesFromFirestore(userId, onError);

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
      _showSnackBar(AppLocalizations.of(context)!.noteLengthExceeded);
      return;
    }

    if (_notes.length >= 10) {
      _showSnackBar(AppLocalizations.of(context)!.tooManyNotes);
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

      failureCallback() =>
          {_showSnackBar(AppLocalizations.of(context)!.failedSavingNote)};

      _dataAccess.addNoteToFirestore(
          note, userId, successCallback, failureCallback);
    }
  }

  void _clearNotes() async {
    onError() =>
        {_showSnackBar(AppLocalizations.of(context)!.failedDeletingNote)};

    final notes = await _dataAccess.getNotesFromFirestore(userId, onError);

    await _dataAccess.clearNotesFromFirestore(notes.docs, onError);

    setState(() {
      _notes.clear();
    });
  }

  void _removeNote(int index) {
    onError() =>
        {_showSnackBar(AppLocalizations.of(context)!.failedDeletingNote)};

    _dataAccess.deleteNoteFromFirestore(_notes[index].document!, onError);

    setState(() {
      _notes.removeAt(index);
    });
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
