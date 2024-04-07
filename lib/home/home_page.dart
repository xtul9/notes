import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/auth/auth.dart';

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
      _showSnackBar('Failed fetching notes.');
    }
  }

  void _addNote(String content) {
    if (content.length > 2000) {
      _showSnackBar('Note length exceeds the limit of 2000 characters.');
      return;
    }

    if (_notes.length >= 10) {
      _showSnackBar('You can only have 10 notes. (I\'m on a free plan dude)');
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
        _showSnackBar('Could not save this note.');
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
      _showSnackBar('Could not delete this note.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Notes'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearNotes,
            tooltip: 'Clear notes',
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
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter note',
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
