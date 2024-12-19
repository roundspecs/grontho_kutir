part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String name;
  final String hallName;
  final String roomNumber;
  final String email;
  final String phoneNumber;
  final String password;

  AuthSignUpWithEmailAndPasswordEvent({
    required this.name,
    required this.hallName,
    required this.roomNumber,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}

class AuthSignInWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}
