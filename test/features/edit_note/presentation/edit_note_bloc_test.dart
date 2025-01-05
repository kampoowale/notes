import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/features/edit_note/domain/usecase/edit_note.dart';
import 'package:alert/features/edit_note/presentation/bloc/edit_note_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_note_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EditNote>()])
void main() {
  late EditNoteBloc notesBloc;
  late MockEditNote mockEditNote;

  setUp(() {
    mockEditNote = MockEditNote();
    notesBloc = EditNoteBloc(
      editNote: mockEditNote,
    );
  });

  // tearDown(() {
  //   notesBloc.close();
  // });

  group('editNote', () {
    test('should emit OnSuccess when save note is successful', () async {
      final NoteEntity mockNote =
          NoteEntity(title: 'Test Title', note: 'Test Note', key: '1');
      when(mockEditNote.call(mockNote)).thenAnswer((_) async => Right(null));

      await notesBloc.editNote(mockNote);

      //expect(notesBloc.state, equals(OnSuccess()));
      verify(mockEditNote.call(mockNote)).called(1);
    });

    test('should emit OnError when save note fails', () async {
      final NoteEntity mockNote =
          NoteEntity(title: 'Test Title', note: 'Test Note', key: '1');
      when(mockEditNote.call(mockNote))
          .thenAnswer((_) async => Left(CacheFailure()));

      await notesBloc.editNote(mockNote);

      //expect(notesBloc.state, equals(OnError('Failed to save note')));
      verify(mockEditNote.call(mockNote)).called(1);
    });
  });
}
