import 'package:flutter/material.dart';

import 'routes.dart';

enum Destination {
  home(
    label: 'Home',
    path: Routes.home,
    icon: Icons.home,
  ),
  book(
    label: 'Book',
    path: Routes.books,
    icon: Icons.book,
  );

  const Destination({
    required this.path,
    required this.label,
    required this.icon,
  });

  final String path;
  final String label;
  final IconData icon;
}
