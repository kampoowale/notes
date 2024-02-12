import 'package:flutter/material.dart';
import 'package:notes/features/add_notes/presentation/widgets/add_notes_alert_dialog.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context){
            return const AddNotesAlertDialog();
          });
        },
      ),
    );
  }
}
