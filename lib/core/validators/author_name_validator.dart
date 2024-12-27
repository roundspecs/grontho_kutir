String? authorNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Author name is required';
  }
  if (value.length < 3) {
    return 'Author name must be at least 3 characters long';
  }
  return null;
}
