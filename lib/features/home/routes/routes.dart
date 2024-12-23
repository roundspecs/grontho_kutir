import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/features/home/presentation/pages/app_scaffold.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

final homeRoutes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return AppScaffold(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(routes: [
        GoRoute(
          path: BookListPage.path,
          pageBuilder: (context, state) {
            return MaterialPage(child: BookListPage());
          },
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          path: '/users',
          pageBuilder: (context, state) {
            return MaterialPage(child: Center(child: Text('Users')));
          },
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          path: '/issues',
          pageBuilder: (context, state) {
            return MaterialPage(child: Center(child: Text('Issues')));
          },
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) {
            return MaterialPage(child: Center(child: Text('Settings')));
          },
        ),
      ])
    ],
  ),
];
