import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class AddCopyUsecase implements Usecase<Copy, AddCopyParams> {
  final CopiesRepository copiesRepository;

  AddCopyUsecase(this.copiesRepository);

  @override
  Future<Either<Failure, Copy>> call(AddCopyParams params) async {
    return await copiesRepository.addCopy(
      bookId: params.bookId,
      condition: params.condition,
      ownerId: params.ownerId,
      representativeID: params.representativeID,
    );
  }
}

class AddCopyParams {
  final String bookId;
  final String condition;
  final String ownerId;
  final String representativeID;

  AddCopyParams({
    required this.bookId,
    required this.condition,
    required this.ownerId,
    required this.representativeID,
  });
}
