import 'package:alert/core/states/ui_state.dart';
import 'package:alert/features/delete_note/domain/usecase/delete_note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteNotesBloc extends Cubit<UIState> {
  final DeleteNote deleteNote;

  DeleteNotesBloc({
    required this.deleteNote,
  }) : super(DefaultState());

  Future<void> deleteSavedNote(String key) async {
    emit(OnLoading());
    final result = await deleteNote.call(key);
    result.fold(
      (failure) => emit(OnError('Failed to delete note')),
      (_) => emit(OnSuccess()),
    );
  }
}
