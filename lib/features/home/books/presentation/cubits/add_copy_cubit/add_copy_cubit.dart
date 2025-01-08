import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/domain/usecases/fetch_profile_by_student_id.dart';
import 'package:grontho_kutir/features/home/books/domain/usecases/add_copy_usecase.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'add_copy_state.dart';

class AddCopyCubit extends Cubit<AddCopyState> {
  final FetchProfileByStudentIdUsecase _fetchProfileByStudentId;
  final AddCopyUsecase _addCopyUsecase;
  AddCopyCubit({
    required FetchProfileByStudentIdUsecase fetchProfileByStudentId,
    required AddCopyUsecase addCopyUsecase,
  })  : _fetchProfileByStudentId = fetchProfileByStudentId,
        _addCopyUsecase = addCopyUsecase,
        super(AddCopyInitial());

  /// Returns a success flag indicating whether the operation was successful.
  ///
  /// Returns:
  /// - `true` if the operation was successful.
  /// - `false` otherwise.
  Future<bool> addCopy({
    required String bookId,
    required String ownerId,
    required String representativeID,
    required String condition,
  }) async {
    emit(AddCopyLoading());
    final ownerProfile = await _fetchProfileByStudentId(ownerId).then(
      (value) {
        return value.fold(
          (failure) {
            emit(AddCopyFailure(failure.message));
            return null;
          },
          (profile) {
            if (profile == null) {
              emit(AddCopyFailure('Owner ID does not exist'));
            }
            return profile;
          },
        );
      },
    );
    if (ownerProfile == null) return false;

    final representativeProfile =
        await _fetchProfileByStudentId(representativeID).then(
      (value) {
        return value.fold(
          (failure) {
            emit(AddCopyFailure(failure.message));
            return null;
          },
          (profile) {
            if (profile == null) {
              emit(AddCopyFailure('Representative ID does not exist'));
            }
            return profile;
          },
        );
      },
    );
    if (representativeProfile == null) return false;

    final result = await _addCopyUsecase(AddCopyParams(
      bookId: bookId,
      condition: condition,
      ownerId: ownerProfile.id,
      representativeID: representativeProfile.id,
    ));
    return result.fold(
      (failure) {
        emit(AddCopyFailure(failure.message));
        return false;
      },
      (copy) {
        emit(AddCopySuccess(copy));
        return true;
      },
    );
  }
}
