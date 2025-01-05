import 'package:alert/core/navigation/app_router.dart';
import 'package:alert/core/navigation/navigation_service.dart';
import 'package:alert/features/get_notes/presentation/bloc/get_notes_bloc.dart';
import 'package:alert/features/get_notes/presentation/pages/notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter().generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.teal,

        // Text theme for the whole app
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          titleMedium: TextStyle(fontSize: 16, color: Colors.white),
          titleSmall: TextStyle(fontSize: 8, color: Colors.white),
        ),

        // Button theme
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal,
          textTheme: ButtonTextTheme.primary,
        ),

        // AppBar theme
        appBarTheme: AppBarTheme(
          color: Colors.teal,
          elevation: 4,
        ),

        // Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.teal[50],
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
      home: BlocProvider(
        create: (context) =>
            sl<GetNotesBloc>()..getSavedNotes(), // Load data on startup
        child: NotesScreen(),
      ),
    );
  }
}