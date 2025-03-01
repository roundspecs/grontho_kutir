import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grontho_kutir/config/secrets.dart';
import 'package:grontho_kutir/data/repositories/book/book_repository.dart';
import 'package:grontho_kutir/domain/models/book/book.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late final BookRepository bookRepository;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    final supabase = await Supabase.initialize(
      url: Secrets.supabaseUrl,
      anonKey: Secrets.supabaseAnonKey,
    );
    bookRepository = BookRepositoryImpl(supabase.client);
  });

  test('print all books', () async {
    final books = await bookRepository.fetchAll();
    debugPrint('Log: $books');
  });

  test('print book by id', () async {
    final books = await bookRepository.fetchAll();
    final id = books.first.id!;
    final book = await bookRepository.fetchById(id);
    debugPrint('Log: $book');
  });

  test('add book', () async {
    final book = Book(
      title: 'Test Book',
      author: 'Test Author',
      category: 'Test Category',
    );
    debugPrint('Log: ${book.toJson()}');
    final addedBook = await bookRepository.add(book);
    debugPrint('Log: $addedBook');
  });

  test('delete book', () async {
    var books = await bookRepository.fetchAll();
    final id = books.last.id!;
    await bookRepository.delete(id);

    books = await bookRepository.fetchAll();
    final isDeleted = books.every((element) => element.id != id);
    debugPrint('Log: ${isDeleted ? 'Deleted' : 'Not Deleted'}');
  });
}
