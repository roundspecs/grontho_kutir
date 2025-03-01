import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/book/book.dart';

abstract interface class BookRepository {
  Future<List<Book>> fetchAll();
  Future<Book> fetchById(int bookId);
  Future<Book> add(Book book);
  Future<void> delete(int bookId);
}

class BookRepositoryImpl implements BookRepository {
  final SupabaseClient _supabaseClient;

  const BookRepositoryImpl(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Future<List<Book>> fetchAll() async {
    final response = await _supabaseClient.from('books').select();
    return response.map((e) => Book.fromJson(e)).toList();
  }

  @override
  Future<Book> fetchById(int bookId) async {
    final response =
        await _supabaseClient.from('books').select().eq('id', bookId).single();
    return Book.fromJson(response);
  }

  @override
  Future<Book> add(Book book) async {
    final response = await _supabaseClient
        .from('books')
        .insert(book.toJson())
        .select()
        .single();
    return Book.fromJson(response);
  }

  @override
  Future<void> delete(int bookId) async {
    await _supabaseClient.from('books').delete().eq('id', bookId);
  }
}
