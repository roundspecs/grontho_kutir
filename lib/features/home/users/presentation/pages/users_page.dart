import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:grontho_kutir/features/home/users/presentation/cubit/user_list_cubit.dart';
import 'package:grontho_kutir/features/home/users/presentation/pages/users_view.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(fetchProfilesUsecase: GetIt.I()),
      child: UsersView(),
    );
  }
}
