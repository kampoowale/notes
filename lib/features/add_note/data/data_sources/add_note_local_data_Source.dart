import 'package:alert/core/models/note_model.dart';
import 'package:hive/hive.dart';

abstract class AddNoteLocalDataSource {
  Future<void> addNote(NoteModel richTextModel);
}

class AddNoteLocalDataSourceImpl implements AddNoteLocalDataSource {
  final Box box;

  AddNoteLocalDataSourceImpl(this.box);

  @override
  Future<void> addNote(NoteModel richTextModel) async {
    await box.put(richTextModel.key,richTextModel);
  }
}