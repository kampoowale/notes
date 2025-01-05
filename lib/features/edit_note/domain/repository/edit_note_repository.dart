import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class EditNoteRepository {
  Future<Either<Failure, void>> editNote(NoteEntity richTextEntity);
}
