part of 'register_view_model.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

final class RegisterLoading extends RegisterState {
  final String message;

  const RegisterLoading(this.message);

  @override
  List<Object> get props => [message];
}

final class RegisterSuccess extends RegisterState {
  final String message;
  final String email;

  const RegisterSuccess(this.message, {required this.email});

  @override
  List<Object> get props => [message, email];
}

final class RegisterFailure extends RegisterState {
  final String message;

  const RegisterFailure(this.message);

  @override
  List<Object> get props => [message];
}
