part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignUpWithEmailAndPassword extends AuthEvent {
  final String name;
  final String hallName;
  final String roomNumber;
  final String email;
  final String password;

  AuthSignUpWithEmailAndPassword({
    required this.name,
    required this.hallName,
    required this.roomNumber,
    required this.email,
    required this.password,
  });
}
