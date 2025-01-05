import 'package:alert/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteNoteRepository {
  Future<Either<Failure, void>> deleteNote(String key);
}
