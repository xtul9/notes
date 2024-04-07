import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/auth/auth.dart';
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
  final notesCollection = FirebaseFirestore.instance.collection('notes');
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
    try {
      final notes = await notesCollection
          .where('userid', isEqualTo: userId)
          .orderBy('order')
          .get();

      for (var doc in notes.docs) {
        setState(() {
          _notes.add(Note(
              document: doc.id,
              content: doc['content'],
              userId: userId,
              order: doc['order'] ?? 0));
        });
      }
    } catch (e) {
      _showSnackBar(AppLocalizations.of(context)!.failedFetchingNotes);
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
      notesCollection.add({
        'userid': auth.currentUser!.uid,
        'content': note.content,
        'order': note.order,
      }).then((value) {
        note = Note(
          document: value.id,
          content: note.content,
          userId: note.userId,
          order: note.order,
        );

        setState(() {
          _notes.add(note);
          noteController.clear();
        });
      }).catchError((error) {
        _showSnackBar(AppLocalizations.of(context)!.failedSavingNote);
      });
    }
  }

  void _clearNotes() {
    setState(() {
      _deleteUserNotesFromFirestore();
      _notes.clear();
    });
  }

  void _deleteUserNotesFromFirestore() async {
    final notes =
        await notesCollection.where('userid', isEqualTo: userId).get();

    for (var doc in notes.docs) {
      await notesCollection.doc(doc.id).delete();
    }
  }

  void _removeNote(int index) {
    setState(() {
      _deleteNoteFromFirestore(_notes[index]);
      _notes.removeAt(index);
    });
  }

  Future<void> _deleteNoteFromFirestore(Note note) async {
    try {
      await notesCollection.doc(note.document).delete();
    } catch (e) {
      _showSnackBar(AppLocalizations.of(context)!.failedDeletingNote);
    }
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
