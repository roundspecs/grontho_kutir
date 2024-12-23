import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class AppDrawer extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppDrawer({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navigationShell.currentIndex,
      children: [
        SizedBox(height: 20),
        ...destinations.map(
          (desitination) {
            return NavigationDrawerDestination(
              label: Text(desitination.label),
              icon: Icon(desitination.icon),
              selectedIcon: Icon(desitination.selectedIcon),
            );
          },
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
          context.read<AuthBloc>().add(AuthSignOutEvent());
          return;
        }
        navigationShell.goBranch(value);
      },
    );
  }
}
