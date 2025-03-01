import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/profile/profile.dart';

abstract interface class ProfileRepository extends ChangeNotifier {
  Session? get currentUserSession;
  Profile? get currentUser;

  Future<Profile> fetchById(String id);
  Future<List<Profile>> fetchAll();
  Future<Profile> logIn({
    required String email,
    required String password,
  });
  Future<Profile> register({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String password,
    required String currentAddress,
  });
  Future<void> signOut();
}

class ProfileRepositoryImpl extends ChangeNotifier
    implements ProfileRepository {
  final SupabaseClient _supabaseClient;

  ProfileRepositoryImpl(SupabaseClient supabaseClient)
      : _supabaseClient = supabaseClient;

  @override
  Session? get currentUserSession => _supabaseClient.auth.currentSession;

  Profile? _currentUser;

  @override
  Profile? get currentUser => _currentUser;

  @override
  Future<Profile> fetchById(String id) async {
    final response = await _supabaseClient
        .from('profiles')
        .select()
        .eq(
          'id',
          id,
        )
        .single();
    return Profile.fromJson(response);
  }

  @override
  Future<List<Profile>> fetchAll() async {
    final response = await _supabaseClient.from('profiles').select();
    return response.map((e) => Profile.fromJson(e)).toList();
  }

  @override
  Future<Profile> logIn({
    required String email,
    required String password,
  }) async {
    final response = await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final id = response.user!.id;
    _currentUser = await fetchById(id);
    notifyListeners();
    return _currentUser!;
  }

  @override
  Future<Profile> register({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String currentAddress,
    required String password,
  }) async {
    final response = await _supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'hall_name': hallName,
        'room_number': roomNumber,
        'phone_number': phoneNumber,
        'current_address': currentAddress,
      },
    );
    final id = response.user!.id;
    _currentUser = await fetchById(id);
    notifyListeners();
    return _currentUser!;
  }

  @override
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
    _currentUser = null;
    notifyListeners();
  }
}
