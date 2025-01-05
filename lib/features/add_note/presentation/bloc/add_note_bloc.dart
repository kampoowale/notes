import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/states/ui_state.dart';
import 'package:alert/features/add_note/domain/usecase/add_note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBloc extends Cubit<UIState> {
  final AddNote addNote;

  AddNoteBloc({
    required this.addNote,
  }) : super(DefaultState());

  Future<void> saveNote(NoteEntity richTextEntity) async {
    emit(OnLoading());
    final result = await addNote.call(richTextEntity);
    result.fold(
      (failure) => emit(OnError('Failed to save note')),
      (_) => emit(OnSuccess()),
    );
  }
}
