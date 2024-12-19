import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class SignInUsecase implements Usecase<UserModel, SignInParams> {
  final AuthRepository authRepository;
  const SignInUsecase(this.authRepository);
  @override
  Future<Either<Failure, UserModel>> call(SignInParams params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
