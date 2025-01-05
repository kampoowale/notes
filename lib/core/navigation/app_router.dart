import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/enum/screen.dart';
import 'package:alert/core/extensions/string_extensions.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/core/widget/error_screen.dart';
import 'package:alert/features/add_note/presentation/pages/add_notes_screen.dart';
import 'package:alert/features/edit_note/presentation/pages/edit_note_screen.dart';
import 'package:alert/features/get_notes/presentation/pages/note_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static final _instance = AppRouter._();

  factory AppRouter() {
    return _instance;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (settings.name == null) {
      return _navigate(ErrorScreen());
    }
    Screen screen = settings.name!.toScreen();
    switch (screen) {
      case Screen.editNote:
        if (args is NoteEntity) {
          return _navigate(
            EditNoteScreen(
              note: args,
            ),
          );
        }
        return _navigate(ErrorScreen());
      case Screen.noteDetails:
        if (args is NoteModel) {
          return _navigate(
            NoteDetailsScreen(
              details: args.note,
              title: args.title,
            ),
          );
        }
        return _navigate(ErrorScreen());
      case Screen.addNote:
        return _navigate(AddNoteScreen());
      default:
        return _navigate(ErrorScreen());
    }
  }

  Route<dynamic> _navigate(Widget screen) {
    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
