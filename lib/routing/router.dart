import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../data/repositories/profile/profile_repository.dart';
import '../ui/auth/login/widgets/login_screen.dart';
import '../ui/auth/register/widgets/register_screen.dart';
import '../ui/core/widgets/shell_scaffold/shell_scaffold.dart';
import 'destination.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _bookNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router(ProfileRepository profileRepository) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellScaffold(shell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: Destination.home.path,
                name: Destination.home.label,
                builder: (context, state) => const Placeholder(
                  child: Text('Home'),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _bookNavigatorKey,
            routes: [
              GoRoute(
                path: Destination.book.path,
                name: Destination.book.label,
                builder: (context, state) => const Placeholder(
                  child: Text('Book'),
                ),
              ),
            ],
          ),
        ],
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
