String? phoneNumberValidator(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) {
    return 'Cannot be empty';
  }
  if (phoneNumber.length != 8) {
    return 'Invalid phone number';
  }
  return null;
}