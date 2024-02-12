import 'package:flutter/material.dart';

class AddNotesAlertDialog extends StatelessWidget {
  const AddNotesAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Add notes'),
      content: TextField(),
      actions: [
      ],
    );
  }
}
