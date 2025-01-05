import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/add_note/data/data_sources/add_note_local_data_Source.dart';
import 'package:alert/features/add_note/data/repository/add_note_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_note_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AddNoteLocalDataSource>()])
void main() {
  late AddNoteRepositoryImpl repository;
  late MockAddNoteLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockAddNoteLocalDataSource();
    repository = AddNoteRepositoryImpl(mockLocalDataSource);
  });

  group('saveRichText,', () {
    test('when saveRichText is successful, should return void', () async {
      final richTextEntity =
          NoteEntity(title: 'Title', note: 'Note', key: '1');
      final richTextModel = NoteModel.fromEntity(richTextEntity);

      when(mockLocalDataSource.addNote(any)).thenAnswer((_) async {});

      final result = await repository.addNote(richTextEntity);

      expect(result, equals(Right(null)));

      verify(mockLocalDataSource.addNote(argThat(equals(richTextModel))))
          .called(1);
    });

    test('when saveRichText fails, should return CacheFailure', () async {
      final richTextEntity =
          NoteEntity(title: 'Title', note: 'Note', key: '1');
      final richTextModel = NoteModel.fromEntity(richTextEntity);
      when(mockLocalDataSource.addNote(richTextModel))
          .thenThrow(Exception('Error'));

      final result = await repository.addNote(richTextEntity);

      expect(result, equals(Left(CacheFailure())));
      verify(mockLocalDataSource.addNote(richTextModel)).called(1);
    });
  });
}
