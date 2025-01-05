import 'package:alert/core/entities/entity_list.dart';
import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/use_cases/use_case.dart';
import 'package:alert/features/get_notes/domain/repository/get_notes_repository.dart';
import 'package:alert/features/get_notes/domain/usecase/get_notes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_notes_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetNotesRepository>()])

void main() {
  late GetNotes useCase;
  late MockGetNotesRepository mockRepository;

  setUp(() {
    mockRepository = MockGetNotesRepository();
    useCase = GetNotes(mockRepository);
  });

  final List<NoteEntity> mockNotes = [
    NoteEntity(title: 'Title 1', note: 'Note 1', key: '1'),
    NoteEntity(title: 'Title 2', note: 'Note 2', key: '2'),
  ];

  final EntityList mockEntityList = EntityList(mockNotes);
group('GetNotes,', (){
  test('should return EntityList when the call to repository is successful', () async {
    when(mockRepository.getNotes())
        .thenAnswer((_) async => Right<Failure, EntityList>(mockEntityList));

    final result = await useCase(NoParams());

    expect(result, Right<Failure, EntityList>(mockEntityList));

    verify(mockRepository.getNotes()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a Failure when the call to repository fails', () async {
    when(mockRepository.getNotes())
        .thenAnswer((_) async => Left(CacheFailure()));

    final result = await useCase(NoParams());

    expect(result, Left<Failure, EntityList>(CacheFailure()));

    verify(mockRepository.getNotes()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
});
}