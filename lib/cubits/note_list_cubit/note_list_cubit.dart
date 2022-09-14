import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:map_exam/cubits/auth_cubit/auth_cubit.dart';
import 'package:map_exam/db/models/note.dart';
import 'package:map_exam/db/repositories/note_repository.dart';

part 'note_list_state.dart';

class NoteListCubit extends Cubit<NoteListState> {
  final NoteRepository noteRepository;
  final AuthCubit authCubit;
  NoteListCubit({
    required this.noteRepository,
    required this.authCubit,
  }) : super(NoteListState.initial());

  Future<void> getAllNotes() async {
    try {
      final notes = await noteRepository.getAllNotes(authCubit.state.user!.uid);
      emit(state.copyWith(notes: notes));
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await noteRepository.deleteNote(authCubit.state.user!.uid, noteId);
      await getAllNotes();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> editNote(dynamic id, String title, String content) async {
    try {
      await noteRepository.editNote(
          authCubit.state.user!.uid, id, title, content);
      await getAllNotes();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> addNote(String title, String content) async {
    try {
      await noteRepository.addNote(authCubit.state.user!.uid, title, content);
      await getAllNotes();
    } on Exception catch (e) {
      print(e);
    }
  }
}
