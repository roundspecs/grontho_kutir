import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

class FetchBooksUsecase implements Usecase<List<Book>, FetchBooksParams> {
  final BookRepository bookRepository;

  FetchBooksUsecase(this.bookRepository);

  @override
  Future<Either<Failure, List<Book>>> call(FetchBooksParams params) async {
    return await bookRepository.fetchBooks(
      page: params.page,
      limit: params.limit,
      searchQuery: params.searchQuery,
      category: params.category,
    );
  }
}

class FetchBooksParams {
  final int page;
  final int limit;
  final String searchQuery;
  final Category category;

  FetchBooksParams({
    required this.page,
    required this.limit,
    required this.searchQuery,
    required this.category,
  });
}
