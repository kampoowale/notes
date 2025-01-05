import 'package:alert/core/di/injection_file.dart';
import 'package:alert/features/get_notes/data/data_sources/get_notes_local_data_Source.dart';
import 'package:alert/features/get_notes/data/repository/get_notes_repository_impl.dart';
import 'package:alert/features/get_notes/domain/repository/get_notes_repository.dart';
import 'package:alert/features/get_notes/domain/usecase/get_notes.dart';
import 'package:alert/features/get_notes/presentation/bloc/get_notes_bloc.dart';

Future<void> initGetNotesDI() async {
  // Data source
  sl.registerLazySingleton<GetNoteLocalDataSource>(
      () => GetNoteLocalDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<GetNotesRepository>(
      () => GetNotesRepositoryImpl(sl()));

  // Use case
  sl.registerLazySingleton(() => GetNotes(sl()));

  // Bloc
  sl.registerFactory(() => GetNotesBloc(
        getNotes: sl(),
      ));
}
