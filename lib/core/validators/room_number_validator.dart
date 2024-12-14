
String? roomNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Cannot be empty';
  }
  final id = int.tryParse(value);
  if (id == null) {
    return 'Enter a valid ID';
  }
  return null;
}
