part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {
  const AppUserState();

  @override
  String toString() {
    return runtimeType.toString();
  }
}

final class AppUserInitial extends AppUserState {}

final class AppUserSuccess extends AppUserState {
  final User user;

  const AppUserSuccess(this.user);
}
