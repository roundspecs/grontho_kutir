import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'add_book_state.dart';

class AddBookCubit extends Cubit<AddBookState> {
  final AddBookUsecase _addBookUsecase;
  AddBookCubit({required AddBookUsecase addBookUsecase})
      : _addBookUsecase = addBookUsecase,
        super(AddBookInitial());

  void addBook({
    required String title,
    required String author,
    required Category category,
  }) async {
    emit(AddBookLoading());
    final response = await _addBookUsecase(AddBookParams(
      title: title,
      author: author,
      category: category,
    ));
    response.fold(
      (failure) {
        debugPrint(failure.message);
        emit(AddBookFailure(failure.message));
      },
      (book) => emit(AddBookSuccess(book)),
    );
    emit(AddBookInitial());
  }
}
