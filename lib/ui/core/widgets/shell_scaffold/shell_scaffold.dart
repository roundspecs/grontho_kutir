import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'shell_scaffold_desktop.dart';
import 'shell_scaffold_mobile.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold({required this.shell, super.key});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        if (constrains.maxWidth < 600) {
          return ShellScaffoldMobile(shell: shell);
        }
        return ShellScaffoldDesktop(shell: shell);
      },
    );
  }
}
