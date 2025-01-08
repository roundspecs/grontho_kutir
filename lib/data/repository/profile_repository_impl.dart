import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/domain/repository/profile_repository.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;
  const ProfileRepositoryImpl(ProfileDataSource profileDataSource)
      : _profileDataSource = profileDataSource;

  @override
  Future<Either<Failure, Profile?>> fetchProfileByStudentId(String id) {
    return _handleErrors(() async {
      final profile = await _profileDataSource.fetchProfileByEmail(
        'u$id@student.cuet.ac.bd',
      );
      return profile;
    });
  }

  @override
  Future<Either<Failure, List<Profile>>> fetchProfiles(
      {required String searchQuery}) {
    return _handleErrors(() async {
      return await _profileDataSource.fetchProfiles(searchQuery: searchQuery);
    });
  }

  Future<Either<Failure, T>> _handleErrors<T>(
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Right(result);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    } on FormatException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure());
    }
  }
}
