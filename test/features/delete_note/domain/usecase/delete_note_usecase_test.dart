import 'package:alert/core/error/failure.dart';
import 'package:alert/features/delete_note/domain/repository/delete_note_repository.dart';
import 'package:alert/features/delete_note/domain/usecase/delete_note.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_note_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DeleteNoteRepository>()])

void main() {
  late MockDeleteNoteRepository mockRepository;
  late DeleteNote deleteNote;

  setUp(() {
    mockRepository = MockDeleteNoteRepository();
    deleteNote = DeleteNote(mockRepository);
  });

  group('DeleteNote', () {
    const String key = '1';

    test('should return void when deleteNote is successful', () async {
      when(mockRepository.deleteNote(key)).thenAnswer((_) async => Right(null));

      final result = await deleteNote(key);

      expect(result, equals(Right<Failure, void>(null)));

      verify(mockRepository.deleteNote(key)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when deleteNote fails', () async {
      when(mockRepository.deleteNote(key))
          .thenAnswer((_) async => Left(CacheFailure()));

      final result = await deleteNote(key);

      expect(result, equals(Left(CacheFailure())));

      verify(mockRepository.deleteNote(key)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}