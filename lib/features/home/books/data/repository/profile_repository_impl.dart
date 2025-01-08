import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/features/home/books/domain/repository/profile_repository.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;
  const ProfileRepositoryImpl(ProfileDataSource profileDataSource)
      : _profileDataSource = profileDataSource;

  @override
  Future<Either<Failure, Profile?>> getProfileByStudentId(String id) {
    return _handleErrors(() async {
      final profile = await _profileDataSource.getProfileByEmail(
        'u$id@student.cuet.ac.bd',
      );
      return profile;
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
