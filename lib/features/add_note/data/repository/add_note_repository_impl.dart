import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/add_note/data/data_sources/add_note_local_data_Source.dart';
import 'package:alert/features/add_note/domain/repository/add_note_repository.dart';
import 'package:dartz/dartz.dart';

class AddNoteRepositoryImpl implements AddNoteRepository {
  final AddNoteLocalDataSource localDataSource;

  AddNoteRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> addNote(NoteEntity richTextEntity) async {
    try {
      final richTextModel = NoteModel.fromEntity(richTextEntity);
      await localDataSource.addNote(richTextModel);
      return Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
