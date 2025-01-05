import 'package:alert/core/entities/entity_list.dart';
import 'package:alert/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class GetNotesRepository {
  Future<Either<Failure, EntityList>> getNotes();
}