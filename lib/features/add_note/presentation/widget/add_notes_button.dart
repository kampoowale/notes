import 'package:alert/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class AddNotesButton extends StatelessWidget {
  const AddNotesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => AddNoteScreen(),
        //   ),
        // );

        NavigationService().navigateTo('add_note');
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
