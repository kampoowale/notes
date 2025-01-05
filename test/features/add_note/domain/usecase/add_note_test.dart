import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/features/add_note/domain/repository/add_note_repository.dart';
import 'package:alert/features/add_note/domain/usecase/add_note.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_note_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AddNoteRepository>()])
void main() {
  late AddNote saveNoteUseCase;
  late MockAddNoteRepository mockRepository;

  setUp(() {
    mockRepository = MockAddNoteRepository();
    saveNoteUseCase = AddNote(mockRepository);
  });

  final NoteEntity mockNoteEntity = NoteEntity(
    title: 'Test Title',
    note: 'Test Note',
    key: '1',
  );
  group('SaveNote', (){
    test('should return void when saveNote is successful', () async {
      when(mockRepository.addNote(mockNoteEntity))
          .thenAnswer((_) async => Right(null));

      final result = await saveNoteUseCase(mockNoteEntity);

      expect(result, equals(Right(null)));

      verify(mockRepository.addNote(mockNoteEntity)).called(1);

      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when saveNote fails', () async {
      when(mockRepository.addNote(mockNoteEntity))
          .thenAnswer((_) async => Left(CacheFailure()));

      final result = await saveNoteUseCase(mockNoteEntity);

      expect(result, equals(Left(CacheFailure())));

      verify(mockRepository.addNote(mockNoteEntity)).called(1);

      verifyNoMoreInteractions(mockRepository);
    });
  });
}
