import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  test('should create a NoteModel object with the provided values', () {

    final title = 'Note Title';
    final note = 'This is a note content';
    final key = '1';

    final noteModel = NoteModel(title: title, note: note, key: key);

    expect(noteModel.title, title);
    expect(noteModel.note, note);
    expect(noteModel.key, key);
  });

  test('should convert NoteModel to RichTextEntity', () {

    final title = 'Note Title';
    final note = 'This is a note content';
    final key = '1';
    final noteModel = NoteModel(title: title, note: note, key: key);

    final entity = noteModel.toEntity();

    expect(entity, isA<NoteEntity>());
    expect(entity.title, title);
    expect(entity.note, note);
    expect(entity.key, key);
  });

  test('should convert RichTextEntity to NoteModel', () {
    final title = 'Note Title';
    final note = 'This is a note content';
    final key = '1';
    final entity = NoteEntity(title: title, note: note, key: key);

    final noteModel = NoteModel.fromEntity(entity);

    expect(noteModel, isA<NoteModel>());
    expect(noteModel.title, title);
    expect(noteModel.note, note);
    expect(noteModel.key, key);
  });
}