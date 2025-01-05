import 'package:alert/core/di/injection_file.dart';
import 'package:alert/core/entities/note_entity.dart';
import 'package:alert/core/models/note_model.dart';
import 'package:alert/core/navigation/navigation_service.dart';
import 'package:alert/features/delete_note/presentation/bloc/delete_notes_bloc.dart';
import 'package:alert/features/get_notes/presentation/pages/note_details_screen.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final NoteModel note;

  const NoteTile({
    super.key,
    required this.note,
  });

  void _deleteNote(String key) async {
    final bloc = sl<DeleteNotesBloc>();
    await bloc.deleteSavedNote(key);
  }

  void _editNote(BuildContext context) {
    NavigationService().navigateTo(
      'edit_note',
      arguments: NoteEntity(
        title: note.title,
        note: note.note,
        key: note.key,
      ),
    );
  }

  void _goToNoteDetails(BuildContext context) {

    NavigationService().navigateTo(
      'note_details',
      arguments: note,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(
            note.title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: PopupMenuButton<String>(
            color: Colors.teal,
            onSelected: (value) {
              if (value == 'edit') {
                _editNote(context);
              } else if (value == 'delete') {
                _deleteNote(note.key);
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem<String>(
                  value: 'edit',
                  child: _MenuOptionTile(
                    text: 'Edit',
                    icon: Icons.edit,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: _MenuOptionTile(
                    text: 'Delete',
                    icon: Icons.delete,
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert), // Menu icon
          ),
          onTap: () {
            _goToNoteDetails(context);
          },
        ),
      ),
    );
  }
}

class _MenuOptionTile extends StatelessWidget {
  final String text;
  final IconData icon;

  const _MenuOptionTile({
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              icon,
              color: Colors.black,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
