import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> singUpWithEmailAndPassword({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<UserModel?> getCurrentUserProfile();

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw ServerException('Failed to sign in');
    }
    return UserModel.fromJson(response.user!.toJson());
  }

  @override
  Future<UserModel> singUpWithEmailAndPassword({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'hall_name': hallName,
        'room_number': roomNumber,
        'phone_number': phoneNumber,
      },
    );
    if (response.user == null) {
      throw ServerException('Failed to sign up');
    }
    return UserModel.fromJson(response.user!.toJson());
  }

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUserProfile() async {
    try {
      if (currentUserSession == null) {
        return null;
      }
      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', currentUserSession!.user.id);
      return UserModel.fromDBJson(
        data: userData.first,
        email: currentUserSession!.user.email!,
      );
    } catch (e) {
      throw ServerException('Failed to get current user profile');
    }
  }

  @override
  Future<void> signOut() {
    return supabaseClient.auth.signOut();
  }
}
