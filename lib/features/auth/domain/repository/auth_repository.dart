import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

abstract interface class AuthRepository {
  Either<Failure, String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Either<Failure, String> singUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
