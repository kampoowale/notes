import 'package:alert/core/di/injection_file.dart';
import 'package:alert/features/add_note/data/data_sources/add_note_local_data_Source.dart';
import 'package:alert/features/add_note/data/repository/add_note_repository_impl.dart';
import 'package:alert/features/add_note/domain/repository/add_note_repository.dart';
import 'package:alert/features/add_note/domain/usecase/add_note.dart';
import 'package:alert/features/add_note/presentation/bloc/add_note_bloc.dart';

Future<void> initAddNoteDI() async {
  // Data source
  sl.registerLazySingleton<AddNoteLocalDataSource>(
      () => AddNoteLocalDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AddNoteRepository>(
      () => AddNoteRepositoryImpl(sl()));

  // Use case
  sl.registerLazySingleton(() => AddNote(sl()));

  // Bloc
  sl.registerFactory(() => AddNoteBloc(
        addNote: sl(),
      ));
}
