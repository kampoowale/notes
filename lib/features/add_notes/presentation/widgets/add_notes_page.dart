import 'package:flutter/material.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  static const address='/addNotes';
  @override
  Widget build(BuildContext context) {
    //todo add material widget to root widget
    return const Material(
      child: Column(
        children: [
          TextField(decoration: InputDecoration(
              hintText: 'Title'
          ),)
        ],
      ),
    );
  }
}
