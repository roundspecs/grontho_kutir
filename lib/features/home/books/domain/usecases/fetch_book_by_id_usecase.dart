import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class FetchBookByIdUsecase implements Usecase<Book, String> {
  final BookRepository bookRepository;

  FetchBookByIdUsecase(this.bookRepository);

  @override
  Future<Either<Failure, Book>> call(String id) async {
    return await bookRepository.fetchBookById(id);
  }
}
