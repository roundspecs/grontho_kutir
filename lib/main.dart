import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'config/dependencies.dart';

void main() async {
  runApp(
    MultiRepositoryProvider(
      providers: await repositories,
      child: App(),
    ),
  );
}
