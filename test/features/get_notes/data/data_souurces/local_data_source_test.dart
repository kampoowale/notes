import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/get_notes/data/data_sources/get_notes_local_data_Source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';

import 'local_data_source_test.mocks.dart';

// Mocking the Hive Box
@GenerateNiceMocks([MockSpec<Box>()])

void main() {
  late GetNoteLocalDataSourceImpl dataSource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = GetNoteLocalDataSourceImpl(mockBox);
  });
  group('Given localDataSource', (){
    test('when getAllRichTexts is called the it should return a list of notes', () async {

      final List<dynamic> mockRichTexts = [
        NoteModel(key: '1', title: 'Title 1', note: 'Content 1'),
        NoteModel(key: '2', title: 'Title 2', note: 'Content 2'),
      ];
      when(mockBox.values).thenReturn(mockRichTexts);

      final result = await dataSource.getNotes();

      expect(result, equals(mockRichTexts));
      verify(mockBox.values).called(1);
    });
  });
}