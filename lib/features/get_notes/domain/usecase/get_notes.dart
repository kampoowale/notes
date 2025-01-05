import 'package:alert/core/entities/entity_list.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../repository/get_notes_repository.dart';

class GetNotes implements UseCase<EntityList, NoParams> {
  final GetNotesRepository repository;

  GetNotes(this.repository);

  @override
  Future<Either<Failure, EntityList>> call(NoParams params) async {
    return await repository.getNotes();
  }
}