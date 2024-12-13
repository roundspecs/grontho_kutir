String? idValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Cannot be empty';
  }
  final id = int.tryParse(value);
  if (value.length != 7 || id == null) {
    return 'Enter a valid ID';
  }
  return null;
}