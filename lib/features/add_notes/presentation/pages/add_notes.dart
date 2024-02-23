import 'package:flutter/material.dart';
import 'package:notes/features/add_notes/presentation/widgets/add_notes_page.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNotesPage.address, arguments: 'Data from home');
        },
      ),
    );
  }
}
