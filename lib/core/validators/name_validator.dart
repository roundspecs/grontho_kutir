String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Cannot be empty';
  }
  if (value.length < 3) {
    return 'Name must be at least 3 characters long';
  }
  if (value.length > 50) {
    return 'Name must be at most 50 characters long';
  }
  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return 'Name must contain only letters';
  }
  return null;
}
