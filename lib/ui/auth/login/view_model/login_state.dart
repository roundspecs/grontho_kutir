part of 'login_view_model.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class LoginLoading extends LoginState {
  final String message;

  const LoginLoading(this.message);

  @override
  List<Object> get props => [message];
}

final class LoginSuccess extends LoginState {
  final String message;

  const LoginSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object> get props => [message];
}
