part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {
  const BookDetailsState();
}

final class BookDetailsLoading extends BookDetailsState {}

final class BookDetailsLoaded extends BookDetailsState {
  final List<Copy> copies;
  final Book book;

  const BookDetailsLoaded({required this.copies, required this.book});
}

final class BookDetailsError extends BookDetailsState {
  final String message;

  const BookDetailsError(this.message);
}
