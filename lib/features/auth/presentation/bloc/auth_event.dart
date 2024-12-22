part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();

  @override
  String toString() {
    return runtimeType.toString();
  }
}

class AuthSignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String name;
  final String hallName;
  final String roomNumber;
  final String email;
  final String phoneNumber;
  final String password;

  const AuthSignUpWithEmailAndPasswordEvent({
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

  const AuthSignInWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}

class AuthGetCurrentUserProfileEvent extends AuthEvent {
  const AuthGetCurrentUserProfileEvent();
}
