import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _handleErrors(() async {
      return await authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  @override
  Future<Either<Failure, User>> singUpWithEmailAndPassword({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    return _handleErrors(() async {
      return await authRemoteDataSource.singUpWithEmailAndPassword(
        name: name,
        hallName: hallName,
        roomNumber: roomNumber,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
    });
  }

  @override
  Future<Either<Failure, User>> getCurrentUserProfile() async {
    return _handleErrors(() async {
      final response = await authRemoteDataSource.getCurrentUserProfile();
      if (response == null) {
        throw AuthException('User not logged in');
      }
      return response;
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

  @override
  Future<Either<Failure, void>> signOut() {
    return _handleErrors(() async {
      await authRemoteDataSource.signOut();
    });
  }
}
