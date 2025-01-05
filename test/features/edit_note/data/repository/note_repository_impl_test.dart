import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/edit_note/data/data_sources/edit_note_local_data_Source.dart';
import 'package:alert/features/edit_note/data/repository/note_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'note_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EditNoteLocalDataSource>()])
void main() {
  late EditNoteRepositoryImpl repository;
  late MockEditNoteLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockEditNoteLocalDataSource();
    repository = EditNoteRepositoryImpl(mockLocalDataSource);
  });

  group('saveRichText,', () {
    test('when saveRichText is successful, should return void', () async {
      final richTextEntity =
          NoteEntity(title: 'Title', note: 'Note', key: '1');
      final richTextModel = NoteModel.fromEntity(richTextEntity);

      when(mockLocalDataSource.editNote(any)).thenAnswer((_) async {});

      final result = await repository.editNote(richTextEntity);

      expect(result, equals(Right(null)));

      verify(mockLocalDataSource.editNote(argThat(equals(richTextModel))))
          .called(1);
    });

    test('when edit note fails, should return CacheFailure', () async {
      final richTextEntity =
          NoteEntity(title: 'Title', note: 'Note', key: '1');
      final richTextModel = NoteModel.fromEntity(richTextEntity);
      when(mockLocalDataSource.editNote(richTextModel))
          .thenThrow(Exception('Error'));

      final result = await repository.editNote(richTextEntity);

      expect(result, equals(Left(CacheFailure())));
      verify(mockLocalDataSource.editNote(richTextModel)).called(1);
    });
  });
}
