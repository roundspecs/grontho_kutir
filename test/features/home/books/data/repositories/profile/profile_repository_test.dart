import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grontho_kutir/config/secrets.dart';
import 'package:grontho_kutir/data/repositories/profile/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late final ProfileRepository profileRepository;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    final supabase = await Supabase.initialize(
      url: Secrets.supabaseUrl,
      anonKey: Secrets.supabaseAnonKey,
    );
    profileRepository = ProfileRepositoryImpl(supabase.client);
  });

  test('print all profiles', () async {
    final profiles = await profileRepository.fetchAll();
    debugPrint('Log: $profiles');
  });

  test('print profile by id', () async {
    final profiles = await profileRepository.fetchAll();
    final id = profiles.first.id!;
    final profile = await profileRepository.fetchById(id);
    debugPrint('Log: $profile');
  });

  test('sign up', () async {
    final profile = await profileRepository.register(
      name: 'Test User',
      hallName: 'Test Hall',
      roomNumber: '101',
      currentAddress: '',
      email: '2502.zarif@gmail.com',
      phoneNumber: '0123456789',
      password: 'test1234',
    );
    final currentSession = profileRepository.currentUserSession;
    debugPrint('Log: $profile, $currentSession');
  });

  test('sign in', () async {
    final profile = await profileRepository.logIn(
      email: '2502.zarif@gmail.com',
      password: 'test1234',
    );
    final currentSession = profileRepository.currentUserSession;
    debugPrint('Log: $profile, $currentSession');
  });

  test('sign out', () async {
    await profileRepository.signOut();
    final currentSession = profileRepository.currentUserSession;
    debugPrint('Log: $currentSession');
  });
}
