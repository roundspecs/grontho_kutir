import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, Profile?>> getProfileByStudentId(String id);
}
