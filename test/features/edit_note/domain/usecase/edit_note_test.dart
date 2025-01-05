import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/features/edit_note/domain/repository/edit_note_repository.dart';
import 'package:alert/features/edit_note/domain/usecase/edit_note.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_note_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EditNoteRepository>()])
void main() {
  late EditNote saveNoteUseCase;
  late MockEditNoteRepository mockRepository;

  setUp(() {
    mockRepository = MockEditNoteRepository();
    saveNoteUseCase = EditNote(mockRepository);
  });

  final NoteEntity mockNoteEntity = NoteEntity(
    title: 'Test Title',
    note: 'Test Note',
    key: '1',
  );
  group('EditNote', (){
    test('should return void when editNote is successful', () async {
      when(mockRepository.editNote(mockNoteEntity))
          .thenAnswer((_) async => Right(null));

      final result = await saveNoteUseCase(mockNoteEntity);

      expect(result, equals(Right(null)));

      verify(mockRepository.editNote(mockNoteEntity)).called(1);

      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when editNote fails', () async {
      when(mockRepository.editNote(mockNoteEntity))
          .thenAnswer((_) async => Left(CacheFailure()));

      final result = await saveNoteUseCase(mockNoteEntity);

      expect(result, equals(Left(CacheFailure())));

      verify(mockRepository.editNote(mockNoteEntity)).called(1);

      verifyNoMoreInteractions(mockRepository);
    });
  });
}
