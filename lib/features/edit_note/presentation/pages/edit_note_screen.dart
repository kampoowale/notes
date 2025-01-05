import 'package:alert/core/di/injection_file.dart';
import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/widget/button.dart';
import 'package:alert/core/widget/note_app_bar.dart';
import 'package:alert/features/edit_note/presentation/bloc/edit_note_bloc.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatelessWidget {
  final NoteEntity note;

  const EditNoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: note.note);
    return Scaffold(
      appBar: NoteAppBar(
        title: 'Edit Note: ${note.title}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                    hintText: 'Write your note here...',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Button(
                onTap: () {
                  final updatedNote = NoteEntity(
                    title: note.title,
                    note: controller.text,
                    key: note.key,
                  );
                  sl<EditNoteBloc>().editSavedNote(updatedNote);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
