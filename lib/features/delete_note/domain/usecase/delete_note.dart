import 'package:alert/core/error/failure.dart';
import 'package:alert/core/use_cases/use_case.dart';
import 'package:alert/features/delete_note/domain/repository/delete_note_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteNote implements UseCase<void,String>{
  final DeleteNoteRepository repository;

  DeleteNote(this.repository);

  @override
  Future<Either<Failure, void>> call(String key) async {
    return await repository.deleteNote(key);
  }

}