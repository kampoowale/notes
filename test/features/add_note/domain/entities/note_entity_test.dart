import 'package:alert/core/entities/note_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NoteEntity', () {
    test('should compare entities based on their properties', () {

      final entity1 = NoteEntity(title: 'Title 1', note: 'Note 1', key: '1');
      final entity2 = NoteEntity(title: 'Title 1', note: 'Note 1', key: '1');
      final entity3 = NoteEntity(title: 'Title 2', note: 'Note 2', key: '2');

      expect(entity1, equals(entity2));
      expect(entity1, isNot(equals(entity3)));
    });
  });
}