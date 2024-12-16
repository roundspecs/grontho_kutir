import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase _signUpUsecase;
  AuthBloc({required SignUpUsecase signUpUsecase})
      : _signUpUsecase = signUpUsecase,
        super(AuthInitial()) {
    on<AuthSignUpWithEmailAndPassword>((event, emit) async {
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
        (userId) {
          debugPrint("User created with id: $userId");
          emit(AuthSuccess(userId));
        },
      );
    });
  }
}
