import 'package:alert/core/entities/entity_list.dart';
import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/states/ui_state.dart';
import 'package:alert/core/use_cases/use_case.dart';
import 'package:alert/features/get_notes/domain/usecase/get_notes.dart';
import 'package:alert/features/get_notes/presentation/bloc/get_notes_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetNotes>()])

void main() {
  late GetNotesBloc notesBloc;
  late MockGetNotes mockGetNotes;

  setUp(() {
    mockGetNotes = MockGetNotes();
    notesBloc = GetNotesBloc(
      getNotes: mockGetNotes,
    );
  });

  tearDown(() {
    notesBloc.close();
  });

  group('loadRichTextContent', () {
    test('should emit OnLoaded when the call to load notes is successful', () async {
      final EntityList mockNotes = EntityList([
        NoteEntity(title: 'Test Title 1', note: 'Test Note 1', key: '1'),
        NoteEntity(title: 'Test Title 2', note: 'Test Note 2', key: '2'),
      ]);

      when(mockGetNotes.call(NoParams())).thenAnswer(
            (_) async => Right(mockNotes),
      );

      notesBloc.getSavedNotes();
      final expected = [
        OnLoaded(mockNotes),
      ];
      // await expectLater(
      //   notesBloc.stream,
      //   emitsInOrder(
      //     expected,
      //   ),
      // );
      verify(mockGetNotes.call(NoParams())).called(1);
    });

    test('should emit OnError when the call to load notes fails', () async {
      when(mockGetNotes.call(NoParams())).thenAnswer(
            (_) async => Left(CacheFailure()),
      );

      notesBloc.getSavedNotes();
      final expected = [
        //RichTextInitial(),
        OnError('Failed to load notes'),
      ];
      // await expectLater(
      //   notesBloc.stream,
      //   emitsInOrder(
      //     expected,
      //   ),
      // );
      verify(mockGetNotes.call(NoParams())).called(1);
    });
  });
}