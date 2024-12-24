import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class SignOutUsecase implements Usecase<void, NoParams> {
  final AuthRepository authRepository;

  SignOutUsecase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.signOut();
  }
}
