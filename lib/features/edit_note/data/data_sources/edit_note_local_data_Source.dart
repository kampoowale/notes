import 'package:alert/core/models/note_model.dart';
import 'package:hive/hive.dart';


abstract class EditNoteLocalDataSource {
  Future<void> editNote(NoteModel richTextModel);
}

class EditNoteLocalDataSourceImpl implements EditNoteLocalDataSource {
  final Box box;

  EditNoteLocalDataSourceImpl(this.box);

  @override
  Future<void> editNote(NoteModel richTextModel) async {
    await box.put(richTextModel.key,richTextModel);
  }
}