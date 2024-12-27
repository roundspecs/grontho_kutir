import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'add_copy_view.dart';

class AddCopyPage extends StatelessWidget {
  static const path = 'add';
  final String bookId;
  const AddCopyPage(this.bookId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCopyCubit(),
      child: AddCopyView(bookId),
    );
  }
}
