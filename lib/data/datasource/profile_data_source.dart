import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProfileDataSource {
  Future<ProfileModel?> fetchProfileByEmail(String email);
  Future<List<ProfileModel>> fetchProfiles({required String searchQuery});
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final SupabaseClient _supabaseClient;

  const ProfileDataSourceImpl(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Future<ProfileModel?> fetchProfileByEmail(String email) async {
    try {
      final response = await _supabaseClient
          .from('profiles')
          .select()
          .eq('email', email)
          .single();
      return ProfileModel.fromJson(response);
    } on PostgrestException catch (_) {
      return null;
    }
  }

  @override
  Future<List<ProfileModel>> fetchProfiles({
    required String searchQuery,
  }) async {
    final response = await _supabaseClient
        .from('profiles')
        .select()
        .ilike('name', '%$searchQuery%');

    return response.map((e) => ProfileModel.fromJson(e)).toList();
  }
}
