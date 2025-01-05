import 'package:alert/core/error/failure.dart';
import 'package:alert/features/delete_note/data/data_sources/local_data_Source.dart';
import 'package:alert/features/delete_note/domain/repository/delete_note_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteNoteRepositoryImpl implements DeleteNoteRepository {
  final DeleteNoteLocalDataSource localDataSource;

  DeleteNoteRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> deleteNote(String key) async {
    try {
      await localDataSource.deleteNote(key);
      return Right(null);
    } catch (e) {
      return Left(
        CacheFailure(),
      );
    }
  }
}
