import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSource _bookDataSource;
  const BookRepositoryImpl(BookDataSource bookDataSource)
      : _bookDataSource = bookDataSource;

  @override
  Future<Either<Failure, Book>> addBook({
    required String title,
    required String author,
    required Category category,
  }) {
    return _handleErrors(() async {
      return await _bookDataSource.addBook(
        title: title,
        author: author,
        category: category,
      );
    });
  }

  @override
  Future<Either<Failure, void>> deleteBook({required String id}) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> fetchBooks({
    required int page,
    required int limit,
    required String searchQuery,
    required Category category,
  }) async {
    return _handleErrors(() async {
      return await _bookDataSource.fetchBooks(
        page: page,
        limit: limit,
        searchQuery: searchQuery,
        category: category,
      );
    });
  }

  @override
  Future<Either<Failure, Book>> updateBook(
      {required String id,
      required String title,
      required String author,
      required Category category}) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }

  Future<Either<Failure, T>> _handleErrors<T>(
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Right(result);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    } on FormatException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure());
    }
  }
}
