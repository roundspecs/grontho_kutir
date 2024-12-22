import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final coreRoutes = [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => MaterialPage(
      child: const Scaffold(
        body: Center(
          child: Text('Home'),
        ),
      ),
    ),
  ),
];
