import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class GetCurrentUserProfileUsecase implements Usecase<User, NoParams> {
  final AuthRepository authRepository;
  const GetCurrentUserProfileUsecase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.getCurrentUserProfile();
  }
}
