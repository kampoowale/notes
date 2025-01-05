import 'package:alert/core/widget/note_app_bar.dart';
import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatelessWidget {
  final String details;
  final String title;

  const NoteDetailsScreen({
    super.key,
    required this.details,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoteAppBar(
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.teal[50],
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                details,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
