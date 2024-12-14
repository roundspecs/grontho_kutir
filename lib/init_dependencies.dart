import 'package:get_it/get_it.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initDependencies() async {
  var supabase = await Supabase.initialize(
    url: Secrets.supabaseUrl,
    anonKey: Secrets.supabaseAnonKey,
  );

  GetIt.I.registerLazySingleton(
    () => supabase.client,
  );
  GetIt.I.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(GetIt.I()),
  );
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(GetIt.I()),
  );
  GetIt.I.registerLazySingleton(
    () => SignUpUsecase(GetIt.I()),
  );
  GetIt.I.registerLazySingleton(
    () => AuthBloc(signUpUsecase: GetIt.I()),
  );
}
