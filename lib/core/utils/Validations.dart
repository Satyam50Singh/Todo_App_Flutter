class Validations {
  static bool isEmailEmpty(String email) {
    return email.trim().isEmpty;
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  static bool isPasswordEmpty(String password) {
    return password.trim().isEmpty;
  }

  static bool isValidPassword(String password) {
   return password.length >=6;
  }
}
