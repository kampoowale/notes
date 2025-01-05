import 'package:alert/core/error/failure.dart';
import 'package:alert/core/states/ui_state.dart';
import 'package:alert/features/delete_note/domain/usecase/delete_note.dart';
import 'package:alert/features/delete_note/presentation/bloc/delete_notes_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_note_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DeleteNote>()])

void main() {
  late DeleteNotesBloc notesBloc;
  late MockDeleteNote mockDeleteNote;

  setUp(() {
    mockDeleteNote = MockDeleteNote();
    notesBloc = DeleteNotesBloc(
      deleteNote: mockDeleteNote,
    );
  });

  tearDown(() {
    notesBloc.close();
  });

  group('deleteSavedNote', () {
    test('should emit OnSuccess when delete note is successful', () async {
      when(mockDeleteNote.call('1')).thenAnswer((_) async => Right(null));

      await notesBloc.deleteSavedNote('1');

      expect(notesBloc.state, equals(OnSuccess()));
      verify(mockDeleteNote.call('1')).called(1);
    });

    test('should emit OnError when delete note fails', () async {
      when(mockDeleteNote.call('1')).thenAnswer((_) async => Left(CacheFailure()));

      await notesBloc.deleteSavedNote('1');

      expect(notesBloc.state, equals(OnError('Failed to delete note')));
      verify(mockDeleteNote.call('1')).called(1);
    });
  });
}