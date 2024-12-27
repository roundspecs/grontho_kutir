import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class Destination {
  final String path;
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final Page Function(BuildContext, GoRouterState)? pageBuilder;

  const Destination({
    required this.path,
    required this.label,
    required this.icon,
    required this.pageBuilder,
    this.selectedIcon,
  });
}

final destinations = [
  Destination(
    path: BookListPage.path,
    label: 'Books',
    icon: Icons.library_books_outlined,
    selectedIcon: Icons.library_books_rounded,
    pageBuilder: (context, state) {
      return MaterialPage(
        child: Title(
          color: Theme.of(context).colorScheme.primary,
          title: 'Books - গ্রন্থকুটির',
          child: BookListPage(),
        ),
      );
    },
  ),
  Destination(
    path: '/users',
    label: 'Users',
    icon: Icons.person_outline,
    selectedIcon: Icons.person_rounded,
    pageBuilder: (context, state) {
      return MaterialPage(
        child: Title(
          color: Theme.of(context).colorScheme.primary,
          title: 'Users - গ্রন্থকুটির',
          child: Center(child: Text('Users')),
        ),
      );
    },
  ),
  Destination(
    path: '/issues',
    label: 'Issues',
    icon: Icons.receipt_long_rounded,
    selectedIcon: Icons.receipt_long,
    pageBuilder: (context, state) {
      return MaterialPage(
        child: Title(
          color: Theme.of(context).colorScheme.primary,
          title: 'Issues - গ্রন্থকুটির',
          child: Center(child: Text('Issues')),
        ),
      );
    },
  ),
  Destination(
    path: '/settings',
    label: 'Settings',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
    pageBuilder: (context, state) {
      return MaterialPage(
        child: Title(
          color: Theme.of(context).colorScheme.primary,
          title: 'Settings - গ্রন্থকুটির',
          child: Center(child: Text('Settings')),
        ),
      );
    },
  ),
];

final homeRoutes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return AppScaffold(navigationShell: navigationShell);
    },
    branches: [
      ...destinations.map((destination) {
        return StatefulShellBranch(routes: [
          if (destination.path == BookListPage.path)
            GoRoute(
              path: destination.path,
              pageBuilder: destination.pageBuilder,
              routes: [
                GoRoute(
                  path: AddBookPage.path,
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      child: Title(
                        color: Theme.of(context).colorScheme.primary,
                        title: 'Add Book - গ্রন্থকুটির',
                        child: AddBookPage(),
                      ),
                    );
                  },
                ),
                GoRoute(
                  path: ':bookId',
                  builder: (context, state) {
                    final bookId = state.pathParameters['bookId']!;
                    return BookDetailsPage(bookId: bookId);
                  },
                  routes: [
                    GoRoute(
                      path: AddCopyPage.path,
                      pageBuilder: (context, state) {
                        final bookId = state.pathParameters['bookId']!;
                        return MaterialPage(
                          child: Title(
                            color: Theme.of(context).colorScheme.primary,
                            title: 'Add Copy - গ্রন্থকুটির',
                            child: AddCopyPage(bookId),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            )
          else
            GoRoute(
              path: destination.path,
              pageBuilder: destination.pageBuilder,
            ),
        ]);
      }),
    ],
  ),
];
