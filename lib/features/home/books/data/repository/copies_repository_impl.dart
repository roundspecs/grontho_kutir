import 'package:fpdart/fpdart.dart';
import 'package:grontho_kutir/grontho_kutir.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CopiesRepositoryImpl implements CopiesRepository {
  final CopiesDataSource copiesDataSource;

  const CopiesRepositoryImpl(this.copiesDataSource);

  @override
  Future<Either<Failure, List<CopyModel>>> fetchCopies(String bookId) async {
    return _handleErrors(() async {
      return await copiesDataSource.fetchCopies(bookId);
    });
  }

  Future<Either<Failure, T>> _handleErrors<T>(
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Right(result);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    } on FormatException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Copy>> addCopy({
    required String bookId,
    required String condition,
    required String ownerId,
    required String representativeID,
  }) {
    return _handleErrors(() async {
      return await copiesDataSource.addCopy(
        bookId: bookId,
        condition: condition,
        ownerId: ownerId,
        representativeID: representativeID,
      );
    });
  }
}
