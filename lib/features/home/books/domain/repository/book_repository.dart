import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

abstract interface class BookRepository {
  Future<Either<Failure, List<Book>>> fetchBooks({
    required int page,
    required int limit,
    required String searchQuery,
    required Category category,
  });

  Future<Either<Failure, Book>> addBook({
    required String title,
    required String author,
    required Category category,
  });

  Future<Either<Failure, Book>> updateBook({
    required String id,
    required String title,
    required String author,
    required Category category,
  });

  Future<Either<Failure, void>> deleteBook({
    required String id,
  });

  Future<Either<Failure, Book>> fetchBookById(String id);
}
