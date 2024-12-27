part of 'add_copy_cubit.dart';

@immutable
sealed class AddCopyState {
  const AddCopyState();
}

final class AddCopyInitial extends AddCopyState {}

final class AddCopyLoading extends AddCopyState {}

final class AddCopySuccess extends AddCopyState {
  final Copy copy;

  const AddCopySuccess(this.copy);
}

final class AddCopyFailure extends AddCopyState {
  final String message;

  const AddCopyFailure(this.message);
}
