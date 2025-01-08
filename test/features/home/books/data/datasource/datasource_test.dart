import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late final SupabaseClient client;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    final supabase = await Supabase.initialize(
      url: Secrets.supabaseUrl,
      anonKey: Secrets.supabaseAnonKey,
    );
    client = supabase.client;
  });

  group('Profiles', () {
    test('Exists', () async {
      final ProfileDataSource profileDataSource = ProfileDataSourceImpl(client);
      final profile = await profileDataSource.fetchProfileByEmail(
        'u2104122@student.cuet.ac.bd',
      );
      debugPrint('Log: $profile');
      expect(profile, isNotNull);
    });

    test('Does not exist', () async {
      final ProfileDataSource profileDataSource = ProfileDataSourceImpl(client);
      final profile = await profileDataSource.fetchProfileByEmail(
        'u2104121@student.cuet.ac.bd',
      );
      debugPrint('Log: $profile');
      expect(profile, isNull);
    });
  });

  group('Copies', () {
    test('print copies', () async {
      final CopiesDataSource copiesDataSource = CopiesDataSourceImpl(client);
      final copies = await copiesDataSource.fetchCopies('1');
      debugPrint('Log: $copies');
    });

    test('add copy', () async {
      final CopiesDataSource copiesDataSource = CopiesDataSourceImpl(client);
      final copy = await copiesDataSource.addCopy(
        bookId: '2',
        condition: 'Good',
        ownerId: '032eafec-cce7-4c4f-8772-cfa396df5d47',
        representativeID: '7e1b8868-236b-47a2-a235-4407c21e2b03',
      );
      debugPrint('Log: $copy');
    });
  });

  tearDownAll(() async {
    await client.dispose();
  });
}
