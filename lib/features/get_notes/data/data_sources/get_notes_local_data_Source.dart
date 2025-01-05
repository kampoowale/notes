import 'package:alert/core/models/note_model.dart';
import 'package:hive/hive.dart';

abstract class GetNoteLocalDataSource {
  Future<List<NoteModel>> getNotes();
}

class GetNoteLocalDataSourceImpl implements GetNoteLocalDataSource {
  final Box box;

  GetNoteLocalDataSourceImpl(this.box);

  @override
  Future<List<NoteModel>> getNotes() async {
    return box.values.cast<NoteModel>().toList();
  }
}
