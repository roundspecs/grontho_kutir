import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> with ChangeNotifier {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user) {
    emit(user == null ? AppUserInitial() : AppUserSuccess(user));
    notifyListeners();
  }

  @override
  void onChange(Change<AppUserState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
