import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/destination.dart';

class ShellScaffoldMobile extends StatelessWidget {
  const ShellScaffoldMobile({required this.shell, super.key});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: shell.goBranch,
        destinations: Destination.values
            .map(
              (destination) => NavigationDestination(
                icon: Icon(destination.icon),
                label: destination.label,
              ),
            )
            .toList(),
      ),
      body: Row(
        children: [
          Expanded(
            child: shell,
          ),
        ],
      ),
    );
  }
}
