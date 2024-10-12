class Validations {
  RegExp numbersRegExp = RegExp(r'^[0-9]+$');
  RegExp phoneNumbersRegExp = RegExp(r'^9[0-9]{8}$');
  RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  RegExp passwordRegExp = RegExp(r'^[a-zA-Z0-9]{8,}$');
  // RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$');
  RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9]{8,}$');

  bool isValidNumber(String contenido) {
    return numbersRegExp.hasMatch(contenido);
  }

  bool isValidPhoneNumber(String contenido) {
    return phoneNumbersRegExp.hasMatch(contenido);
  }

  bool isValidEmail(String contenido) {
    return emailRegExp.hasMatch(contenido);
  }

  bool isValidPassword(String contenido) {
    return passwordRegExp.hasMatch(contenido);
  }

  bool isValidUsername(String contenido) {
    return usernameRegExp.hasMatch(contenido);
  }
}
