abstract class IValidations {
  bool isEmailEmpty(String email);
  bool isPasswordEmpty(String password);
  bool isValidPassword(String password);
}

class Validations implements IValidations {
  @override
  bool isEmailEmpty(String email) {
    return email.isEmpty;
  }

  @override
  bool isPasswordEmpty(String password) {
    return password.isEmpty;
  }

  @override
  bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
