import 'package:alert/core/enum/screen.dart';
import 'package:alert/core/extensions/string_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('stringToEnum', () {
    test('should return expected value', () {
      // Arrange
      String noteDetails = 'note_details';
      String editNote = 'edit_note';
      String addNote = 'add_note';
      String undefined = 'unknown';

      // Act
      Screen resultNoteDetails = noteDetails.toScreen();
      Screen resultEditNote = editNote.toScreen();
      Screen resultAddNote = addNote.toScreen();
      Screen resultUndefined = undefined.toScreen();

      // Assert
      expect(resultNoteDetails, equals(Screen.noteDetails));
      expect(resultEditNote, equals(Screen.editNote));
      expect(resultAddNote, equals(Screen.addNote));
      expect(resultUndefined, equals(Screen.undefined));
    });
  });
}
