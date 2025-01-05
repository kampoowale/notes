import 'package:alert/core/states/ui_state.dart';
import 'package:alert/core/widget/loading_error.dart';
import 'package:alert/features/add_note/presentation/widget/add_notes_button.dart';
import 'package:alert/features/get_notes/presentation/bloc/get_notes_bloc.dart';
import 'package:alert/features/get_notes/presentation/widgets/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes',style: Theme.of(context).textTheme.titleLarge),
      ),
      body: BlocBuilder<GetNotesBloc, UIState>(
        builder: (context, state) {
          if (state is OnLoaded) {
            return Notes();
          } else if (state is OnError) {
            return LoadingError(
              errorMessage: state.message,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: AddNotesButton(),
    );
  }
}
