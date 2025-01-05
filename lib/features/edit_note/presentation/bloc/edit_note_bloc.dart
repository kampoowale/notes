import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/states/ui_state.dart';
import 'package:alert/features/edit_note/domain/usecase/edit_note.dart';
import 'package:bloc/bloc.dart';

class EditNoteBloc extends Cubit<UIState> {
  final EditNote editNote;

  EditNoteBloc({
    required this.editNote,
  }) : super(DefaultState());

  Future<void> editSavedNote(NoteEntity note) async {
    emit(OnLoading());
    final result = await editNote.call(note);
    result.fold(
      (failure) => emit(OnError('Failed to save note')),
      (_) => emit(OnSuccess()),
    );
  }
}
