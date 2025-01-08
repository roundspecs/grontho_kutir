import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProfileDataSource {
  Future<ProfileModel?> getProfileByEmail(String email);
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final SupabaseClient _supabaseClient;

  const ProfileDataSourceImpl(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Future<ProfileModel?> getProfileByEmail(String email) async {
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
}
