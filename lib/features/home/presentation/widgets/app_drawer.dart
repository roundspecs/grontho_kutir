import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppDrawer({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navigationShell.currentIndex,
      children: [
        SizedBox(height: 20),
        NavigationDrawerDestination(
          label: Text('Books'),
          icon: Icon(Icons.library_books_outlined),
          selectedIcon: Icon(Icons.library_books_rounded),
        ),
        NavigationDrawerDestination(
          label: Text('Users'),
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person_rounded),
        ),
        NavigationDrawerDestination(
          label: Text('Issues'),
          icon: Icon(Icons.receipt_long_rounded),
          selectedIcon: Icon(Icons.receipt_long),
        ),
        NavigationDrawerDestination(
          label: Text('Settings'),
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings_rounded),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.logout_rounded),
          label: Text('Logout'),
        ),
      ],
      onDestinationSelected: (value) {
        context.pop();
        if (value == 4) {
          // Logout
          return;
        }
        navigationShell.goBranch(value);
      },
    );
  }
}
