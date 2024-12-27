String? bookTitleValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Cannot be empty';
  }
  if (value.length < 3) {
    return 'Book name must be at least 3 characters long';
  }
  return null;
}
