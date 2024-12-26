import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class AddBookUsecase implements Usecase<Book, AddBookParams> {
  final BookRepository bookRepository;

  AddBookUsecase(this.bookRepository);

  @override
  Future<Either<Failure, Book>> call(AddBookParams params) async {
    return await bookRepository.addBook(
      title: params.title,
      author: params.author,
      category: params.category,
    );
  }
}

class AddBookParams {
  final String title;
  final String author;
  final Category category;

  AddBookParams({
    required this.title,
    required this.author,
    required this.category,
  });
}
