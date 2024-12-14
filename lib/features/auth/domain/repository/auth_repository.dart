import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> singUpWithEmailAndPassword({
    required String name,
    required String? hallName,
    required int? roomNumber,
    required String email,
    required String password,
  });
}
