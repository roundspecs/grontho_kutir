import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grontho_kutir/features/home/core/widgets/column_with_spacing.dart';
import 'package:grontho_kutir/features/home/users/presentation/cubit/user_list_cubit.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserListCubit>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnWithSpacing(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Expanded(child: _searchBar(context)),
              // _addBookButton(context),
            ],
          ),
          // _categoryFilter(context),
          _usersTable(context),
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return SearchBar(
      controller: _searchController,
      onSubmitted: (value) {
        context.read<UserListCubit>().fetchUsers(
              searchQuery: value,
            );
      },
    );
  }

  Widget _usersTable(BuildContext context) {
    return BlocConsumer<UserListCubit, UserListState>(
      listener: (context, state) {
        if (state is UserListFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error loading users'),
            ),
          );
        }
      },
      builder: (context, state) {
        return switch (state) {
          UserListLoading _ => const CircularProgressIndicator(),
          UserListFailure _ => const Text('Error loading users'),
          UserListLoaded state => Builder(builder: (context) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Hall Name')),
                    DataColumn(label: Text('Room Number')),
                    DataColumn(label: Text('Phone Number')),
                  ],
                  rows: state.users
                      .map(
                        (user) => DataRow(
                          cells: [
                            DataCell(Text(user.name)),
                            DataCell(Text(user.email)),
                            DataCell(Text(user.hallName)),
                            DataCell(Text(user.roomNumber)),
                            DataCell(Text(user.phoneNumber)),
                          ],
                        ),
                      )
                      .toList(),
                ),
              );
            }),
          _ => const SizedBox(),
        };
      },
    );
  }
}
