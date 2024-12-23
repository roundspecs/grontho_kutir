import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/features/home/presentation/pages/app_scaffold.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class Destination {
  final String path;
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final Widget page;
  const Destination({
    required this.path,
    required this.label,
    required this.icon,
    required this.page,
    this.selectedIcon,
  });
}

final destinations = [
  Destination(
    path: "/",
    label: "Books",
    icon: Icons.library_books_outlined,
    selectedIcon: Icons.library_books_rounded,
    page: BookListPage(),
  ),
  Destination(
    path: "/users",
    label: "Users",
    icon: Icons.person_outline,
    selectedIcon: Icons.person_rounded,
    page: Center(child: Text('Users')),
  ),
  Destination(
    path: "/issues",
    label: "Issues",
    icon: Icons.receipt_long_rounded,
    selectedIcon: Icons.receipt_long,
    page: Center(child: Text('Issues')),
  ),
  Destination(
    path: "/settings",
    label: "Settings",
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
    page: Center(child: Text('Settings')),
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
          GoRoute(
            path: destination.path,
            pageBuilder: (context, state) {
              return MaterialPage(child: destination.page);
            },
          ),
        ]);
      }),
    ],
  ),
];
