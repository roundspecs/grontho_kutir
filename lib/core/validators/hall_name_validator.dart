String? hallNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Cannot be empty';
  }
  return null;
}
