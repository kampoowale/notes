import 'package:flutter/material.dart';
import 'package:notes/features/add_notes/presentation/pages/add_notes.dart';
import 'package:notes/features/add_notes/presentation/widgets/add_notes_page.dart';

class Navigation {
  Navigation._();

  static final _instance = Navigation._();
  static get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _getMaterialPageRoute(const AddNotes());
      case '/addNotes':
        return MaterialPageRoute(builder: (_) => const AddNotesPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  MaterialPageRoute _getMaterialPageRoute(final Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
