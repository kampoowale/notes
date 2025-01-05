import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/add_note/data/data_sources/add_note_local_data_Source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';

import 'add_note_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box>()])

void main() {
  late AddNoteLocalDataSourceImpl dataSource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = AddNoteLocalDataSourceImpl(mockBox);
  });
  group('Given localDataSource', (){

    test('when saveRichText is called then it should save the note', () async {

      final note = NoteModel(key: '1', title: 'Title 1', note: 'Content 1');
      when(mockBox.put(note.key, note)).thenAnswer((_) async => null); // mock `put` method

      await dataSource.addNote(note);

      verify(mockBox.put(note.key, note)).called(1);
    });

  });
}