import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/edit_note/data/data_sources/edit_note_local_data_Source.dart';
import 'package:alert/features/edit_note/domain/repository/edit_note_repository.dart';
import 'package:dartz/dartz.dart';

class EditNoteRepositoryImpl implements EditNoteRepository {
  final EditNoteLocalDataSource localDataSource;

  EditNoteRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> editNote(NoteEntity richTextEntity) async {
    try {
      final richTextModel = NoteModel.fromEntity(richTextEntity);
      await localDataSource.editNote(richTextModel);
      return Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
