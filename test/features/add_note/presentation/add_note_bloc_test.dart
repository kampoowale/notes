import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/states/ui_state.dart';
import 'package:alert/features/add_note/domain/usecase/add_note.dart';
import 'package:alert/features/add_note/presentation/bloc/add_note_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AddNote>()])
void main() {
  late AddNoteBloc notesBloc;
  late MockAddNote mockSaveNote;

  setUp(() {
    mockSaveNote = MockAddNote();
    notesBloc = AddNoteBloc(
      addNote: mockSaveNote,
    );
  });

  tearDown(() {
    notesBloc.close();
  });

  group('saveRichTextContent', () {
    test('should emit OnSuccess when save note is successful', () async {
      final NoteEntity mockNote =
          NoteEntity(title: 'Test Title', note: 'Test Note', key: '1');
      when(mockSaveNote.call(mockNote)).thenAnswer((_) async => Right(null));

      await notesBloc.saveNote(mockNote);

      expect(notesBloc.state, equals(OnSuccess()));
      verify(mockSaveNote.call(mockNote)).called(1);
    });

    test('should emit OnError when save note fails', () async {
      final NoteEntity mockNote =
          NoteEntity(title: 'Test Title', note: 'Test Note', key: '1');
      when(mockSaveNote.call(mockNote))
          .thenAnswer((_) async => Left(CacheFailure()));

      await notesBloc.saveNote(mockNote);

      expect(notesBloc.state, equals(OnError('Failed to save note')));
      verify(mockSaveNote.call(mockNote)).called(1);
    });
  });
}
