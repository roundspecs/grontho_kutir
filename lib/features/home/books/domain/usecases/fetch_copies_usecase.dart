import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class FetchCopiesUsecase implements Usecase<List<Copy>, String> {
  final CopiesRepository copiesRepository;

  FetchCopiesUsecase(this.copiesRepository);

  @override
  Future<Either<Failure, List<Copy>>> call(String bookId) async {
    return await copiesRepository.fetchCopies(bookId);
  }
}
