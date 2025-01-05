import 'package:hive/hive.dart';

abstract class DeleteNoteLocalDataSource {
  Future<void> deleteNote(String key);
}

class DeleteNoteLocalDataSourceImpl implements DeleteNoteLocalDataSource {
  final Box box;

  DeleteNoteLocalDataSourceImpl(this.box);

  @override
  Future<void> deleteNote(String key) async {
    return await box.delete(key);
  }
}
