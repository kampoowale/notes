import 'package:alert/features/add_note/data/data_sources/add_note_local_data_Source.dart';
import 'package:alert/features/add_note/data/repository/add_note_repository_impl.dart';
import 'package:alert/features/add_note/domain/repository/add_note_repository.dart';
import 'package:alert/features/add_note/domain/usecase/add_note.dart';
import 'package:alert/features/add_note/presentation/bloc/add_note_bloc.dart';
import 'package:alert/features/delete_note/data/data_sources/local_data_Source.dart';
import 'package:alert/features/delete_note/data/repository/note_repository_impl.dart';
import 'package:alert/features/delete_note/domain/repository/delete_note_repository.dart';
import 'package:alert/features/delete_note/domain/usecase/delete_note.dart';
import 'package:alert/features/delete_note/presentation/bloc/delete_notes_bloc.dart';
import 'package:alert/features/edit_note/data/data_sources/edit_note_local_data_Source.dart';
import 'package:alert/features/edit_note/data/repository/note_repository_impl.dart';
import 'package:alert/features/edit_note/domain/repository/edit_note_repository.dart';
import 'package:alert/features/edit_note/domain/usecase/edit_note.dart';
import 'package:alert/features/edit_note/presentation/bloc/edit_note_bloc.dart';
import 'package:alert/features/get_notes/data/data_sources/get_notes_local_data_Source.dart';
import 'package:alert/features/get_notes/data/repository/get_notes_repository_impl.dart';
import 'package:alert/features/get_notes/domain/repository/get_notes_repository.dart';
import 'package:alert/features/get_notes/domain/usecase/get_notes.dart';
import 'package:alert/features/get_notes/presentation/bloc/get_notes_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note_model.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Register Hive
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  final box = await Hive.openBox<NoteModel>('notesBox');

  // Data sources
  sl.registerLazySingleton<AddNoteLocalDataSource>(
      () => AddNoteLocalDataSourceImpl(box));

  sl.registerLazySingleton<EditNoteLocalDataSource>(
      () => EditNoteLocalDataSourceImpl(box));

  sl.registerLazySingleton<DeleteNoteLocalDataSource>(
      () => DeleteNoteLocalDataSourceImpl(box));

  sl.registerLazySingleton<GetNoteLocalDataSource>(
      () => GetNoteLocalDataSourceImpl(box));

  // Repositories
  sl.registerLazySingleton<AddNoteRepository>(
      () => AddNoteRepositoryImpl(sl()));

  sl.registerLazySingleton<EditNoteRepository>(
      () => EditNoteRepositoryImpl(sl()));

  sl.registerLazySingleton<DeleteNoteRepository>(
      () => DeleteNoteRepositoryImpl(sl()));

  sl.registerLazySingleton<GetNotesRepository>(
      () => GetNotesRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetNotes(sl()));
  sl.registerLazySingleton(() => AddNote(sl()));
  sl.registerLazySingleton(() => DeleteNote(sl()));
  sl.registerLazySingleton(() => EditNote(sl()));

  sl.registerFactory(() => GetNotesBloc(
        getNotes: sl(),
      ));
  sl.registerFactory(() => AddNoteBloc(
        addNote: sl(),
      ));
  sl.registerFactory(() => EditNoteBloc(
        editNote: sl(),
      ));

  sl.registerFactory(() => DeleteNotesBloc(
        deleteNote: sl(),
      ));
}
