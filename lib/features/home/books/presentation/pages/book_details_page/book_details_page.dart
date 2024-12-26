import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'book_details_view.dart';

class BookDetailsPage extends StatelessWidget {
  final String bookId;
  const BookDetailsPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookDetailsCubit(),
      child: BookDetailsView(),
    );
  }
}
