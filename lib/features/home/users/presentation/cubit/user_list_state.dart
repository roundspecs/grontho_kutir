part of 'user_list_cubit.dart';

@immutable
sealed class UserListState {}

final class UserListInitial extends UserListState {}

final class UserListLoading extends UserListState {
  final String message;
  UserListLoading(this.message);
}

final class UserListLoaded extends UserListState {
  final List<Profile> users;
  UserListLoaded(this.users);
}

final class UserListFailure extends UserListState {
  final String message;
  UserListFailure(this.message);
}
