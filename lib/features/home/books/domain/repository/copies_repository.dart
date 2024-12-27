import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

abstract interface class CopiesRepository {
  Future<Either<Failure, List<Copy>>> fetchCopies(String bookId);
}
