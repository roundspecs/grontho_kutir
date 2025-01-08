import 'package:get_it/get_it.dart';
import 'package:grontho_kutir/features/home/books/data/repository/copies_repository_impl.dart';
import 'package:grontho_kutir/features/home/books/data/repository/profile_repository_impl.dart';
import 'package:grontho_kutir/features/home/books/domain/repository/profile_repository.dart';
import 'package:grontho_kutir/features/home/books/domain/usecases/add_copy_usecase.dart';
import 'package:grontho_kutir/features/home/books/domain/usecases/fetch_profile_by_student_id.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initDependencies() async {
  var supabase = await Supabase.initialize(
    url: Secrets.supabaseUrl,
    anonKey: Secrets.supabaseAnonKey,
  );

  GetIt.I
    ..registerLazySingleton(() => supabase.client)
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(GetIt.I()),
    )
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(GetIt.I()))
    ..registerLazySingleton(() => AppUserCubit())
    ..registerLazySingleton(() => SignUpUsecase(GetIt.I()))
    ..registerLazySingleton(() => SignInUsecase(GetIt.I()))
    ..registerLazySingleton(() => SignOutUsecase(GetIt.I()))
    ..registerLazySingleton(() => GetCurrentUserProfileUsecase(GetIt.I()))
    ..registerLazySingleton(
      () => AuthBloc(
        signUpUsecase: GetIt.I(),
        signInUsecase: GetIt.I(),
        signOutUsecase: GetIt.I(),
        getCurrentUserProfileUsecase: GetIt.I(),
        appUserCubit: GetIt.I(),
      ),
    )
    ..registerLazySingleton(() => Router(GetIt.I<AppUserCubit>()))
    ..registerLazySingleton<BookDataSource>(() => BookDataSourceImpl(GetIt.I()))
    ..registerLazySingleton<BookRepository>(() => BookRepositoryImpl(GetIt.I()))
    ..registerLazySingleton<CopiesDataSource>(
      () => CopiesDataSourceImpl(GetIt.I()),
    )
    ..registerLazySingleton<CopiesRepository>(
      () => CopiesRepositoryImpl(GetIt.I()),
    )
    ..registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceImpl(GetIt.I()),
    )
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(GetIt.I()),
    )
    ..registerLazySingleton(() => FetchBooksUsecase(GetIt.I()))
    ..registerLazySingleton(() => AddBookUsecase(GetIt.I()))
    ..registerLazySingleton(() => FetchCopiesUsecase(GetIt.I()))
    ..registerLazySingleton(() => FetchProfileByStudentId(GetIt.I()))
    ..registerLazySingleton(() => AddCopyUsecase(GetIt.I()))
    ..registerLazySingleton(() => FetchBookByIdUsecase(GetIt.I()))
    ..registerLazySingleton(() => BookListCubit(fetchBooksUsecase: GetIt.I()))
    ..registerFactory(() => AddBookCubit(addBookUsecase: GetIt.I()));
}
