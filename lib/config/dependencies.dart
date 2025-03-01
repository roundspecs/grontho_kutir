import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/repositories/book/book_repository.dart';
import '../data/repositories/profile/profile_repository.dart';
import 'secrets.dart';

Future<List<SingleChildWidget>> get repositories async {
  var client = (await Supabase.initialize(
    url: Secrets.supabaseUrl,
    anonKey: Secrets.supabaseAnonKey,
  ))
      .client;

  return [
    RepositoryProvider<BookRepository>(
      create: (_) => BookRepositoryImpl(client),
    ),
    ChangeNotifierProvider<ProfileRepository>(
      create: (_) => ProfileRepositoryImpl(client),
    ),
  ];
}
