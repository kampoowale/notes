import 'package:alert/core/models/note_model.dart';
import 'package:alert/features/delete_note/data/data_sources/local_data_Source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';

import 'local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box>()])

void main() {
  late DeleteNoteLocalDataSourceImpl dataSource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = DeleteNoteLocalDataSourceImpl(mockBox);
  });
  group('Given DeleteNoteLocalDataSource,', (){

    test('when deleteNote is called then it should delete the note', () async {

      final noteKey = '1';
      when(mockBox.delete(noteKey)).thenAnswer((_) async => null); // mock `delete` method

      await dataSource.deleteNote(noteKey);

      verify(mockBox.delete(noteKey)).called(1);
    });
  });
}