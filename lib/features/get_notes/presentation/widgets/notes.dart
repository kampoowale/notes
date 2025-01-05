import 'package:alert/core/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'note_tile.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: WatchBoxBuilder(
                box: Hive.box<NoteModel>('notesBox'),
                builder: (context, notes) {
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes.getAt(index) as NoteModel;
                      return NoteTile(note: note);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
