import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/edit_note/data/data_sources/edit_note_local_data_Source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';

import 'edit_note_local_data_source_test.mocks.dart';

// Mocking the Hive Box
@GenerateNiceMocks([MockSpec<Box>()])

void main() {
  late EditNoteLocalDataSourceImpl dataSource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = EditNoteLocalDataSourceImpl(mockBox);
  });
  group('Given localDataSource', (){

    test('when editRichText is called then it should save the note', () async {

      final note = NoteModel(key: '1', title: 'Title 1', note: 'Content 1');
      when(mockBox.put(note.key, note)).thenAnswer((_) async => null); // mock `put` method

      await dataSource.editNote(note);

      verify(mockBox.put(note.key, note)).called(1);
    });

  });
}