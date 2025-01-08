import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class CopiesDataSource {
  Future<List<CopyModel>> fetchCopies(String bookId);

  Future<CopyModel> addCopy({
    required String bookId,
    required String condition,
    required String ownerId,
    required String representativeID,
  });
}

class CopiesDataSourceImpl implements CopiesDataSource {
  final SupabaseClient _supabaseClient;
  const CopiesDataSourceImpl(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Future<List<CopyModel>> fetchCopies(String bookId) async {
    final response = await _supabaseClient
        .from('copies')
        .select(
          '*, book:books(*), '
          'owner:owner_id(*), '
          'representative:representative_id(*)',
        )
        .eq('book_id', bookId);
    return response.map((e) => CopyModel.fromJson(e)).toList();
  }

  @override
  Future<CopyModel> addCopy({
    required String bookId,
    required String condition,
    required String ownerId,
    required String representativeID,
  }) async {
    final response = await _supabaseClient
        .from('copies')
        .insert({
          'book_id': bookId,
          'condition': condition,
          'owner_id': ownerId,
          'representative_id': representativeID,
        })
        .select(
          '*, book:books(*), '
          'owner:owner_id(*), '
          'representative:representative_id(*)',
        )
        .single();
    return CopyModel.fromJson(response);
  }
}
