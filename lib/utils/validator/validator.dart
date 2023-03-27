class Validator {
  static RegExp mobileRegex = RegExp(r'^(\+|\d)[0-9]{5,15}$');
}

String? mandatoryValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'required field';
  }
  return null;
}
