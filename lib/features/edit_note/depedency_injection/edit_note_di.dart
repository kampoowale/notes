import 'package:alert/core/di/injection_file.dart';
import 'package:alert/features/edit_note/data/data_sources/edit_note_local_data_Source.dart';
import 'package:alert/features/edit_note/data/repository/note_repository_impl.dart';
import 'package:alert/features/edit_note/domain/repository/edit_note_repository.dart';
import 'package:alert/features/edit_note/domain/usecase/edit_note.dart';
import 'package:alert/features/edit_note/presentation/bloc/edit_note_bloc.dart';

Future<void> initEditNoteDI() async {
  // Data source
  sl.registerLazySingleton<EditNoteLocalDataSource>(
      () => EditNoteLocalDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<EditNoteRepository>(
      () => EditNoteRepositoryImpl(sl()));

  // Use case
  sl.registerLazySingleton(() => EditNote(sl()));

  // Bloc
  sl.registerFactory(() => EditNoteBloc(
        editNote: sl(),
      ));
}
