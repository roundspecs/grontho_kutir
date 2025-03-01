import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../data/repositories/profile/profile_repository.dart';

part 'register_state.dart';

class RegisterViewModel extends Cubit<RegisterState> {
  final ProfileRepository _profileRepository;

  RegisterViewModel({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(RegisterInitial());

  void register({
    required String name,
    required String hallName,
    required String roomNumber,
    required String email,
    required String phoneNumber,
    required String password,
    required String currentAddress,
  }) async {
    emit(RegisterLoading('Registering...'));
    try {
      await _profileRepository.register(
        name: name,
        hallName: hallName,
        roomNumber: roomNumber,
        email: email,
        phoneNumber: phoneNumber,
        currentAddress: currentAddress,
        password: password,
      );
      emit(RegisterSuccess('Registration successful', email: email));
    } on AuthException catch (error) {
      emit(RegisterFailure(error.message));
    } on PostgrestException catch (error) {
      debugPrint('ERRORLOG: $error');
      emit(RegisterFailure(
          'An unexpected error occurred. Please contact the administrator.'));
    } catch (error) {
      debugPrint('ERRORLOG: $error');
      emit(RegisterFailure(error.toString()));
    }
  }
}
