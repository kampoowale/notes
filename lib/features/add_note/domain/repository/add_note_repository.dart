import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AddNoteRepository {
  Future<Either<Failure, void>> addNote(NoteEntity richTextEntity);
}
