import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(response);
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
  Future<Either<Failure, UserModel>> singUpWithEmailAndPassword({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.singUpWithEmailAndPassword(
        name: name,
        hallName: hallName,
        roomNumber: roomNumber,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(response);
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
