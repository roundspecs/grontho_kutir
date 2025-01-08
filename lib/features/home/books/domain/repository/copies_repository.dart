import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

abstract interface class CopiesRepository {
  Future<Either<Failure, List<Copy>>> fetchCopies(String bookId);

  Future<Either<Failure, Copy>> addCopy({
    required String bookId,
    required String condition,
    required String ownerId,
    required String representativeID,
  });
}
