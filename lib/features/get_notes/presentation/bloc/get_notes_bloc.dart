import 'package:alert/core/states/ui_state.dart';
import 'package:alert/core/use_cases/use_case.dart';
import 'package:alert/features/get_notes/domain/usecase/get_notes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNotesBloc extends Cubit<UIState> {
  final GetNotes getNotes;

  GetNotesBloc({
    required this.getNotes,
  }) : super(DefaultState());

  Future<void> getSavedNotes() async {
    emit(OnLoading());
    final result = await getNotes.call(NoParams());
    result.fold(
      (failure) {
        emit(OnError('Failed to load notes'));
      },
      (richTextEntities) {
        emit(OnLoaded(richTextEntities));
      },
    );
  }
}
