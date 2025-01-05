import 'package:alert/core/entities/entity_list.dart';
import 'package:alert/core/error/failure.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/get_notes/data/data_sources/get_notes_local_data_Source.dart';
import 'package:alert/features/get_notes/domain/repository/get_notes_repository.dart';
import 'package:dartz/dartz.dart';

class GetNotesRepositoryImpl implements GetNotesRepository {
  final GetNoteLocalDataSource localDataSource;

  GetNotesRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, EntityList>> getNotes() async {
    try {
      List<NoteModel> result = await localDataSource.getNotes();
      EntityList richTextEntities = _convertNoteModelsToEntities(result);
      return Right(richTextEntities);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  EntityList _convertNoteModelsToEntities(List<NoteModel> noteModels) {
    final entities =
        noteModels.map((noteModel) => noteModel.toEntity()).toList();
    return EntityList(entities);
  }
}
