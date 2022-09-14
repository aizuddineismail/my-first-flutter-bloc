part of 'note_tool_cubit.dart';

enum NoteToolStatus {
  hide,
  show,
}

class NoteToolState extends Equatable {
  final NoteToolStatus noteToolStatus;
  final dynamic id;

  NoteToolState({
    required this.noteToolStatus,
    required this.id,
  });

  factory NoteToolState.initial() {
    return NoteToolState(
      noteToolStatus: NoteToolStatus.hide,
      id: '',
    );
  }

  @override
  List<Object> get props => [noteToolStatus, id];

  @override
  String toString() =>
      'NoteToolState(noteToolStatus: $noteToolStatus, id: $id)';

  NoteToolState copyWith({
    NoteToolStatus? noteToolStatus,
    dynamic id,
  }) {
    return NoteToolState(
      noteToolStatus: noteToolStatus ?? this.noteToolStatus,
      id: id ?? this.id,
    );
  }
}
