import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

final authRoutes = [
  GoRoute(
    path: SignInPage.path,
    pageBuilder: (context, state) => MaterialPage(
      child: const SignInPage(),
    ),
  ),
  GoRoute(
    path: SignUpPage.path,
    pageBuilder: (context, state) => MaterialPage(
      child: const SignUpPage(),
    ),
  ),
];
