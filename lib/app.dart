import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routing/router.dart';
import 'ui/auth/login/view_model/login_view_model.dart';
import 'ui/auth/register/view_model/register_view_model.dart';
import 'ui/core/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginViewModel(profileRepository: context.read()),
        ),
        BlocProvider(
          create: (_) => RegisterViewModel(profileRepository: context.read()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router(context.read()),
      ),
    );
  }
}
