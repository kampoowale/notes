import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/use_cases/use_case.dart';
import 'package:alert/features/add_note/domain/repository/add_note_repository.dart';
import 'package:dartz/dartz.dart';

class AddNote implements UseCase<void, NoteEntity> {
  final AddNoteRepository repository;

  AddNote(this.repository);

  @override
  Future<Either<Failure, void>> call(NoteEntity richTextEntity) async {
    return await repository.addNote(richTextEntity);
  }
}
