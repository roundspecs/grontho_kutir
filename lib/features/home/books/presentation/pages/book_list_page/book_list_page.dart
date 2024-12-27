import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'book_list_view.dart';

class BookListPage extends StatelessWidget {
  static const path = '/books';

  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<BookListCubit>()
        ..fetchBooks(
          category: Category.all,
        ),
      child: BookListView(),
    );
  }
}
