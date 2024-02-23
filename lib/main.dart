import 'package:flutter/material.dart';
import 'package:notes/features/add_notes/presentation/pages/add_notes.dart';
import 'package:notes/framework/navigation/navigation.dart';

void main() {
  runApp(const MyNotesHome());
}

class MyNotesHome extends StatelessWidget {
  const MyNotesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Navigation.instance.generateRoute,
      home: AddNotes(),
    );
  }
}
