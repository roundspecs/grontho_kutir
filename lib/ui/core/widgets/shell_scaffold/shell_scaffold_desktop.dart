import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/destination.dart';

class ShellScaffoldDesktop extends StatelessWidget {
  const ShellScaffoldDesktop({required this.shell, super.key});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            selectedIndex: shell.currentIndex,
            onDestinationSelected: shell.goBranch,
            destinations: Destination.values
                .map(
                  (destination) => NavigationRailDestination(
                    icon: Icon(destination.icon),
                    label: Text(destination.label),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: shell,
          ),
        ],
      ),
    );
  }
}
