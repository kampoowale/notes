import 'package:alert/core/di/injection_file.dart';
import 'package:alert/features/delete_note/data/data_sources/local_data_Source.dart';
import 'package:get_it/get_it.dart';
import 'package:alert/features/delete_note/data/repository/note_repository_impl.dart';
import 'package:alert/features/delete_note/domain/repository/delete_note_repository.dart';
import 'package:alert/features/delete_note/domain/usecase/delete_note.dart';
import 'package:alert/features/delete_note/presentation/bloc/delete_notes_bloc.dart';

Future<void> initDeleteNoteDI() async {
  // Data source
  sl.registerLazySingleton<DeleteNoteLocalDataSource>(
          () => DeleteNoteLocalDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<DeleteNoteRepository>(
          () => DeleteNoteRepositoryImpl(sl()));

  // Use case
  sl.registerLazySingleton(() => DeleteNote(sl()));

  // Bloc
  sl.registerFactory(() => DeleteNotesBloc(
    deleteNote: sl(),
  ));
}