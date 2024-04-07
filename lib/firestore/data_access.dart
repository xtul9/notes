import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/note.dart';

class DataAccess {
  final notesCollection = FirebaseFirestore.instance.collection('notes');

  Future<QuerySnapshot> getNotesFromFirestore(
      String userId, Function() onError) {
    try {
      return notesCollection
          .where('userid', isEqualTo: userId)
          .orderBy('order')
          .get();
    } catch (e) {
      onError();
      rethrow;
    }
  }

  void addNoteToFirestore(
      Note note, String userId, Function(Note) onSuccess, Function() onError) {
    notesCollection.add({
      'userid': userId,
      'content': note.content,
      'order': note.order,
    }).then((value) {
      note = Note(
        document: value.id,
        content: note.content,
        userId: note.userId,
        order: note.order,
      );

      onSuccess(note);
    }).catchError((error) {
      onError();
    });
  }

  Future<void> clearNotesFromFirestore<T>(
      List<QueryDocumentSnapshot<T>> documents, Function() onError) async {
    try {
      for (var doc in documents) {
        await notesCollection.doc(doc.id).delete();
      }
    } catch (e) {
      onError();
    }
  }

  Future<void> deleteNoteFromFirestore(
      String documentId, Function() onError) async {
    try {
      await notesCollection.doc(documentId).delete();
    } catch (e) {
      onError();
    }
  }
}
