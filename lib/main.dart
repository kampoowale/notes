import 'package:flutter/material.dart';

void main() {
  runApp(const MyNotesHome());
}

class MyNotesHome extends StatelessWidget {
  const MyNotesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text('Hello'),
    );
  }
}
