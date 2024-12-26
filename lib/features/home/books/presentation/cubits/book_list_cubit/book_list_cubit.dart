import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'book_list_state.dart';

class BookListCubit extends Cubit<BookListState> {
  final FetchBooksUsecase _fetchBooksUsecase;
  BookListCubit({
    required FetchBooksUsecase fetchBooksUsecase,
  })  : _fetchBooksUsecase = fetchBooksUsecase,
        super(BookListLoading());

  Future<void> fetchBooks({
    String? searchQuery,
    required Category category,
  }) async {
    emit(BookListLoading());
    final books = await _fetchBooksUsecase(
      FetchBooksParams(
        page: 1,
        limit: 10,
        searchQuery: searchQuery ?? '',
        category: category,
      ),
    );
    books.fold(
      (failure) {
        debugPrint(failure.message);
        emit(BookListError(failure.message));
      },
      (books) => emit(BookListLoaded(books)),
    );
  }
}
