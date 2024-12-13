import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class SignUpUsecase implements Usecase<String, SignUpParams> {
  final AuthRepository authRepository;
  const SignUpUsecase(this.authRepository);
  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.singUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
