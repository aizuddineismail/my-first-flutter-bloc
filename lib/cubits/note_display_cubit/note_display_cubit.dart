import 'package:bloc/bloc.dart';

part 'note_display_state.dart';

class NoteDisplayCubit extends Cubit<NoteDisplayState> {
  NoteDisplayCubit() : super(NoteDisplayState.show);

  void toggleDisplay() {
    state == NoteDisplayState.show
        ? emit(NoteDisplayState.hide)
        : emit(NoteDisplayState.show);
  }
}
