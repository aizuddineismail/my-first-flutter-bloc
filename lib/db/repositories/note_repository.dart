import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_exam/db/models/note.dart';

class NoteRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Note>> getAllNotes(String uid) async {
    try {
      final notesRef = await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .get();

      if (notesRef.docs.isNotEmpty) {
        return notesRef.docs
            .map((doc) => Note.fromJson({
                  'id': doc.id,
                  ...doc.data(),
                }))
            .toList();
      }
      return [];
    } on FirebaseException catch (e) {
      print(e);
      throw 'Firebase Error';
    }
  }

  Future<void> deleteNote(String uid, String noteId) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .delete();
    } on FirebaseException catch (e) {
      print(e);
      throw 'Firebase Error';
    }
  }
}
