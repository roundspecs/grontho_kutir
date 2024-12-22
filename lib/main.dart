import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<AppUserCubit>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthGetCurrentUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Grontho Kutir',
      theme: theme,
      routerConfig: GetIt.I<Router>().config,
    );
  }
}
