import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
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
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
