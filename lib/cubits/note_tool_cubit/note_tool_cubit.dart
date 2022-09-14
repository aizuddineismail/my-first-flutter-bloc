import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'note_tool_state.dart';

class NoteToolCubit extends Cubit<NoteToolState> {
  NoteToolCubit() : super(NoteToolState.initial());

  void toggleNoteTool(dynamic id) {
    if (state.id != id) {
      emit(state.copyWith(noteToolStatus: NoteToolStatus.show, id: id));
    } else {
      emit(state.copyWith(noteToolStatus: NoteToolStatus.hide, id: ''));
    }
  }
}
