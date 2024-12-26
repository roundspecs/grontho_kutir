import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BookDataSource {
  Future<List<Book>> fetchBooks({
    required int page,
    required int limit,
    required String searchQuery,
    required Category category,
  });

  Future<Book> addBook({
    required String title,
    required String author,
    required Category category,
  });

  Future<Book> updateBook({
    required String id,
    required String title,
    required String author,
    required Category category,
  });

  Future<void> deleteBook({
    required String id,
  });
}

class BookDataSourceImpl implements BookDataSource {
  final SupabaseClient _supabaseClient;
  const BookDataSourceImpl(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Future<BookModel> addBook({
    required String title,
    required String author,
    required Category category,
  }) async {
    final response = await _supabaseClient
        .from('books')
        .insert({
          'title': title,
          'author': author,
          'category': category.name,
        })
        .select()
        .single();
    return BookModel.fromJson(response);
  }

  @override
  Future<void> deleteBook({required String id}) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> fetchBooks({
    required int page,
    required int limit,
    required String searchQuery,
    required Category category,
  }) async {
    final List<Map<String, dynamic>> response;
    if (category == Category.all) {
      response = await _supabaseClient
          .from('books')
          .select('*, copies(count)')
          .or('title.ilike.%$searchQuery%,author.ilike.%$searchQuery%');
    } else {
      response = await _supabaseClient
          .from('books')
          .select('*, copies(count)')
          .eq('category', category.name)
          .or('title.ilike.%$searchQuery%,author.ilike.%$searchQuery%');
    }
    return response.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<Book> updateBook({
    required String id,
    required String title,
    required String author,
    required Category category,
  }) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }
}
