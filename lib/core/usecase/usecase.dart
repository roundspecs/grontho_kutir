import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/core/core.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
