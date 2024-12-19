import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase _signUpUsecase;
  final SignInUsecase _signInUsecase;
  AuthBloc({required SignUpUsecase signUpUsecase, required SignInUsecase signInUsecase})
      : _signUpUsecase = signUpUsecase, _signInUsecase = signInUsecase,
        super(AuthInitial()) {
    on<AuthSignUpWithEmailAndPasswordEvent>(_onAuthSignUpWithEmailAndPasswordEvent);
    on<AuthSignInWithEmailAndPasswordEvent>(_onAuthSignInWithEmailAndPasswordEvent);
  }

  FutureOr<void> _onAuthSignUpWithEmailAndPasswordEvent(event, emit) async {
    emit(AuthLoading());
    final response = await _signUpUsecase(SignUpParams(
      name: event.name,
      hallName: event.hallName,
      roomNumber: event.roomNumber,
      email: event.email,
      phoneNumber: event.phoneNumber,
      password: event.password,
    ));
    response.fold(
      (failure) {
        debugPrint(failure.message);
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint("User created with id: ${user.id}");
        emit(AuthSuccess(user));
      },
    );
  }

  Future<void> _onAuthSignInWithEmailAndPasswordEvent(
    AuthSignInWithEmailAndPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await _signInUsecase(SignInParams(
      email: event.email,
      password: event.password,
    ));
    response.fold(
      (failure) {
        debugPrint(failure.message);
        emit(AuthFailure(failure.message));
      },
      (user) {
        debugPrint("User signed in with id: ${user.id}");
        emit(AuthSuccess(user));
      },
    );
  }
}
