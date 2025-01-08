import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/core/core.dart';
import 'package:grontho_kutir/features/home/books/domain/entities/profile.dart';
import 'package:grontho_kutir/features/home/books/domain/repository/profile_repository.dart';

class FetchProfileByStudentId implements Usecase<Profile?, String> {
  final ProfileRepository profileRepository;

  FetchProfileByStudentId(this.profileRepository);

  @override
  Future<Either<Failure, Profile?>> call(String id) async {
    return await profileRepository.getProfileByStudentId(id);
  }
}
