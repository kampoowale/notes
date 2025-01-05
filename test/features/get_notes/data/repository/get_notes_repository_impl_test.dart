import 'package:alert/core/entities/entity_list.dart';
import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/get_notes/data/data_sources/get_notes_local_data_Source.dart';
import 'package:alert/features/get_notes/data/repository/get_notes_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetNoteLocalDataSource>()])
void main() {
  late GetNotesRepositoryImpl repository;
  late MockGetNoteLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockGetNoteLocalDataSource();
    repository = GetNotesRepositoryImpl(mockLocalDataSource);
  });

  group('getNotes,', () {
    test(
        'when the call to local data source is successful, should return a list of notes',
        () async {
      // Arrange
      final List<NoteModel> mockNotes = [
        NoteModel(
          title: 'Title 1',
          note: 'Note 1',
          key: '1',
        ),
        NoteModel(
          title: 'Title 2',
          note: 'Note 2',
          key: '2',
        ),
      ];
      final List<NoteEntity> expectedEntities = [
        NoteEntity(title: 'Title 1', note: 'Note 1', key: '1'),
        NoteEntity(title: 'Title 2', note: 'Note 2', key: '2'),
      ];

      when(mockLocalDataSource.getNotes())
          .thenAnswer((_) async => mockNotes);

      // Act
      final result = await repository.getNotes();

      // Assert
      expect(
          result,
          equals(Right<Failure, EntityList>(
              EntityList(expectedEntities))));
      verify(mockLocalDataSource.getNotes()).called(1);
    });

    test('when the call to local data source fails, should return CacheFailure',
        () async {
      when(mockLocalDataSource.getNotes()).thenThrow(Exception('Error'));

      final result = await repository.getNotes();

      expect(result, equals(Left(CacheFailure())));
      verify(mockLocalDataSource.getNotes()).called(1);
    });
  });
}
