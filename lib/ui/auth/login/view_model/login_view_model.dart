import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../data/repositories/profile/profile_repository.dart';

part 'login_state.dart';

class LoginViewModel extends Cubit<LoginState> {
  final ProfileRepository _profileRepository;
  LoginViewModel({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(LoginInitial());

  void logIn({required String email, required String password}) async {
    emit(LoginLoading('Logging in...'));
    try {
      await _profileRepository.logIn(email: email, password: password);
      emit(LoginSuccess('Login successful'));
    } on AuthException catch (error) {
      emit(LoginFailure(error.message));
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
