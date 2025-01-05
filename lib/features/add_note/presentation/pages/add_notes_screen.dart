import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/widget/button.dart';
import 'package:alert/features/add_note/presentation/bloc/add_note_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection_file.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _addNote(BuildContext context) async {
    String title = _titleController.text.trim();
    String content = _contentController.text.trim();

    final bloc = sl<AddNoteBloc>();
    await bloc.saveNote(
      NoteEntity(
        title: title,
        note: content,
        key: DateTime.now().millisecondsSinceEpoch.toString(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Note',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Enter note title',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Content',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                  controller: _contentController,
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
            SizedBox(height: 24),
            Button(
              onTap: () {
                _addNote(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
