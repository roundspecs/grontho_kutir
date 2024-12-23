import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

/// https://stackoverflow.com/questions/71011598/how-to-work-with-navigationbar-in-go-router-flutter
class AppScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grontho Kutir')),
      drawer: AppDrawer(navigationShell: navigationShell),
      body: navigationShell,
    );
  }
}
