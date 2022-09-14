part of 'note_list_cubit.dart';

class NoteListState extends Equatable {
  final List<Note> notes;

  NoteListState({
    required this.notes,
  });

  factory NoteListState.initial() {
    return NoteListState(notes: const []);
  }

  @override
  List<Object> get props => [notes];

  @override
  String toString() => 'NoteListState(notes: $notes)';

  NoteListState copyWith({
    List<Note>? notes,
  }) {
    return NoteListState(
      notes: notes ?? this.notes,
    );
  }
}
