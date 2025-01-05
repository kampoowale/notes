import 'package:alert/core/entities/note_entity.dart';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String note;

  @HiveField(2)
  final String key;

  NoteModel({
    required this.title,
    required this.note,
    required this.key,
  });

  // Convert NoteModel to RichTextEntity
  NoteEntity toEntity() {
    return NoteEntity(
      title: title,
      note: note,
      key: key,
    );
  }

  // Factory constructor to convert RichTextEntity to NoteModel
  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      title: entity.title,
      note: entity.note,
      key: entity.key,
    );
  }

  // Equatable properties for comparison
  @override
  List<Object?> get props => [title, note, key];
}