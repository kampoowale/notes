import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final String title;
  final String note;
  final String key;

  const NoteEntity({
    required this.title,
    required this.note,
    required this.key,
  });

  @override
  List<Object?> get props => [
        title,
        note,
        key,
      ];
}