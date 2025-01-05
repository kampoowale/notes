import 'package:alert/core/error/failure.dart';
import 'package:alert/core/use_cases/use_case.dart';
import 'package:alert/features/edit_note/domain/repository/edit_note_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:alert/core/entities/note_entity.dart';
class EditNote implements UseCase<void, NoteEntity> {
  final EditNoteRepository repository;

  EditNote(this.repository);

  @override
  Future<Either<Failure, void>> call(NoteEntity note) async {
    return await repository.editNote(note);
  }
}
