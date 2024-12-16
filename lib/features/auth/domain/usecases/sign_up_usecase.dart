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
      phoneNumber: params.phoneNumber,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String hallName;
  final String roomNumber;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpParams({
    required this.name,
    required this.hallName,
    required this.roomNumber,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}
