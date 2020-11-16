/// Used to validate password, email, and name with the help of some regular expressions

class Validators {
  static final RegExp _emailRegExp =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email) && email.endsWith('com');
  }

  static bool isUsernameValid(String username) {
    return username.length > 5;
  }

  static bool isValidPassword(String password) {
    // bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    // bool hasDigits = password.contains(RegExp(r'[0-9]'));
    // bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasMinLength = password.length >= 8;
    return  hasMinLength;
  }
}
