import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../data/repositories/profile/profile_repository.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/auth/register/widgets/register_screen.dart';
import 'routes.dart';

GoRouter router(ProfileRepository profileRepository) {
  return GoRouter(
    initialLocation: Routes.home,
    refreshListenable: profileRepository,
    redirect: _redirect,
    routes: [
      GoRoute(
        path: Routes.logIn,
        builder: (context, _) => LoginScreen(viewModel: context.read()),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, _) => RegisterScreen(viewModel: context.read()),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, _) => const Center(child: Text('Home')),
      ),
    ],
  );
}

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn =
      context.read<ProfileRepository>().currentUserSession != null;
  final isAuthRoute = Routes.unauthRoutes.contains(state.matchedLocation);

  if (isLoggedIn && isAuthRoute) {
    return Routes.home;
  } else if (!isLoggedIn && !isAuthRoute) {
    return Routes.logIn;
  }
  return null;
}
