import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/core/error/failure.dart';
import 'package:grontho_kutir/core/usecase/usecase.dart';
import 'package:grontho_kutir/domain/entities/profile.dart';
import 'package:grontho_kutir/domain/repository/profile_repository.dart';

class FetchProfilesUsecase
    implements Usecase<List<Profile>, FetchProfilesParams> {
  final ProfileRepository profileRepository;

  FetchProfilesUsecase(this.profileRepository);

  @override
  Future<Either<Failure, List<Profile>>> call(
      FetchProfilesParams params) async {
    return await profileRepository.fetchProfiles(
        searchQuery: params.searchQuery);
  }
}

class FetchProfilesParams {
  final String searchQuery;

  FetchProfilesParams(this.searchQuery);
}
