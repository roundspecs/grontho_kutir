import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> singUpWithEmailAndPassword({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String password,
  });
}
