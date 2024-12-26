import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'add_book_view.dart';

class AddBookPage extends StatelessWidget {
  static const String path = 'add';

  const AddBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AddBookCubit>(),
      child: AddBookView(),
    );
  }
}
