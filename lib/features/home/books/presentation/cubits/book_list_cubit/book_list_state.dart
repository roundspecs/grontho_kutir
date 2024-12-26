part of 'book_list_cubit.dart';

@immutable
sealed class BookListState {
  const BookListState();
}

final class BookListLoading extends BookListState {}

final class BookListLoaded extends BookListState {
  final List<Book> books;
  const BookListLoaded(this.books);
}

final class BookListError extends BookListState {
  final String message;
  const BookListError(this.message);
}
