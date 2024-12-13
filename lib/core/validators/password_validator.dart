String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Cannot be empty';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  if (value.length > 20) {
    return 'Password must be at most 20 characters long';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  return null;
}