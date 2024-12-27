import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/grontho_kutir.dart';

part 'add_copy_state.dart';

class AddCopyCubit extends Cubit<AddCopyState> {
  AddCopyCubit() : super(AddCopyInitial());
}
