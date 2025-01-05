import 'package:alert/core/entities/note_entity.dart';
import 'package:equatable/equatable.dart';

class EntityList extends Equatable {
  final List<NoteEntity> entities;

  const EntityList(this.entities);

  @override
  List<Object?> get props => [entities];
}