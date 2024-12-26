part of 'add_book_cubit.dart';

@immutable
sealed class AddBookState {
  const AddBookState();
}

final class AddBookInitial extends AddBookState {}

final class AddBookLoading extends AddBookState {}

final class AddBookSuccess extends AddBookState {
  final Book book;

  const AddBookSuccess(this.book);
}

final class AddBookFailure extends AddBookState {
  final String message;

  const AddBookFailure(this.message);
}
