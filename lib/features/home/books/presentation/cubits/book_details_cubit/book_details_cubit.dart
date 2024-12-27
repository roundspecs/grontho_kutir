import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  final FetchCopiesUsecase _fetchCopiesUsecase;
  final FetchBookByIdUsecase _fetchBookByIdUsecase;
  BookDetailsCubit(FetchCopiesUsecase fetchCopiesUsecase,
      FetchBookByIdUsecase fetchBookByIdUsecase)
      : _fetchCopiesUsecase = fetchCopiesUsecase,
        _fetchBookByIdUsecase = fetchBookByIdUsecase,
        super(BookDetailsLoading());

  Future<void> fetchDetails(String bookId) async {
    emit(BookDetailsLoading());
    final copies = await _fetchCopiesUsecase(bookId);
    final book = await _fetchBookByIdUsecase(bookId);
    emit(
      copies.fold(
        (failure) => BookDetailsError(failure.message),
        (copies) => book.fold(
          (failure) => BookDetailsError(failure.message),
          (book) => BookDetailsLoaded(copies: copies, book: book),
        ),
      ),
    );
  }
}
