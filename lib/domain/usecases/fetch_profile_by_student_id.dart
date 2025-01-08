import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/core/core.dart';
import 'package:grontho_kutir/domain/entities/profile.dart';
import 'package:grontho_kutir/domain/repository/profile_repository.dart';

class FetchProfileByStudentIdUsecase implements Usecase<Profile?, String> {
  final ProfileRepository profileRepository;

  FetchProfileByStudentIdUsecase(this.profileRepository);

  @override
  Future<Either<Failure, Profile?>> call(String id) async {
    return await profileRepository.fetchProfileByStudentId(id);
  }
}
