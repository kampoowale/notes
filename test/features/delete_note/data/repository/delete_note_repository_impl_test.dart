import 'package:alert/core/error/failure.dart';
import 'package:alert/features/delete_note/data/data_sources/local_data_Source.dart';
import 'package:alert/features/delete_note/data/repository/note_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'note_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DeleteNoteLocalDataSource>()])
void main() {
  late DeleteNoteRepositoryImpl repository;
  late MockDeleteNoteLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockDeleteNoteLocalDataSource();
    repository = DeleteNoteRepositoryImpl(mockLocalDataSource);
  });

  group('deleteNote,', () {
    test('when deleteNote is successful, should return void', () async {
      final key = '1';
      when(mockLocalDataSource.deleteNote(key)).thenAnswer((_) async {});

      final result = await repository.deleteNote(key);

      expect(result, equals(Right(null)));
      verify(mockLocalDataSource.deleteNote(key)).called(1);
    });

    test('when deleteNote fails, should return CacheFailure', () async {
      final key = '1';
      when(mockLocalDataSource.deleteNote(key)).thenThrow(Exception('Error'));

      final result = await repository.deleteNote(key);

      expect(result, equals(Left(CacheFailure())));
      verify(mockLocalDataSource.deleteNote(key)).called(1);
    });
  });
}
