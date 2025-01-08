import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/domain/usecases/fetch_profiles_usecase.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  final FetchProfilesUsecase _fetchProfilesUsecase;

  UserListCubit({required FetchProfilesUsecase fetchProfilesUsecase})
      : _fetchProfilesUsecase = fetchProfilesUsecase,
        super(UserListInitial());

  Future<void> fetchUsers({String searchQuery = ''}) async {
    emit(UserListLoading('Loading users...'));
    final users = await _fetchProfilesUsecase(FetchProfilesParams(searchQuery));
    emit(
      users.fold(
        (failure) => UserListFailure(failure.message),
        (users) => UserListLoaded(users),
      ),
    );
  }
}
