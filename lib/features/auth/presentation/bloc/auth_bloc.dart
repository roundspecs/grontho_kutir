import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase _signUpUsecase;
  final SignInUsecase _signInUsecase;
  final SignOutUsecase _signOutUsecase;
  final GetCurrentUserProfileUsecase _getCurrentUserProfileUsecase;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required SignUpUsecase signUpUsecase,
    required SignInUsecase signInUsecase,
    required SignOutUsecase signOutUsecase,
    required GetCurrentUserProfileUsecase getCurrentUserProfileUsecase,
    required AppUserCubit appUserCubit,
  })  : _signUpUsecase = signUpUsecase,
        _signInUsecase = signInUsecase,
        _signOutUsecase = signOutUsecase,
        _getCurrentUserProfileUsecase = getCurrentUserProfileUsecase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUpWithEmailAndPasswordEvent>(
      _onAuthSignUpWithEmailAndPasswordEvent,
    );
    on<AuthSignInWithEmailAndPasswordEvent>(
      _onAuthSignInWithEmailAndPasswordEvent,
    );
    on<AuthSignOutEvent>(_onAuthSignOutEvent);
    on<AuthGetCurrentUserProfileEvent>(_onAuthGetCurrentUserProfileEvent);
  }

  FutureOr<void> _onAuthSignUpWithEmailAndPasswordEvent(event, emit) async {
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
      (user) => _emitAuthSuccess(user: user, emit: emit),
    );
  }

  Future<void> _onAuthSignInWithEmailAndPasswordEvent(
    AuthSignInWithEmailAndPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _signInUsecase(SignInParams(
      email: event.email,
      password: event.password,
    ));
    response.fold(
      (failure) {
        debugPrint(failure.message);
        emit(AuthFailure(failure.message));
      },
      (user) => _emitAuthSuccess(user: user, emit: emit),
    );
  }

  Future<void> _onAuthSignOutEvent(
    AuthSignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _signOutUsecase(NoParams());
    response.fold(
      (failure) {
        debugPrint(failure.message);
        emit(AuthFailure(failure.message));
      },
      (_) {
        _appUserCubit.updateUser(null);
        emit(AuthInitial());
      },
    );
  }

  Future<void> _onAuthGetCurrentUserProfileEvent(
    AuthGetCurrentUserProfileEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _getCurrentUserProfileUsecase(NoParams());
    response.fold(
      (failure) {
        debugPrint(failure.message);
        emit(AuthInitial());
      },
      (user) => _emitAuthSuccess(user: user, emit: emit),
    );
  }

  Future<void> _emitAuthSuccess({
    required User user,
    required Emitter emit,
  }) async {
    debugPrint('User found with id: ${user.id}');
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    debugPrint(transition.toString());
  }
}
