import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class SignUpUsecase implements Usecase<String, SignUpParams> {
  final AuthRepository authRepository;
  const SignUpUsecase(this.authRepository);
  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.singUpWithEmailAndPassword(
      name: params.name,
      hallName: params.hallName,
      roomNumber: params.roomNumber,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String? hallName;
  final int? roomNumber;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.hallName,
    required this.roomNumber,
    required this.email,
    required this.password,
  });
}
