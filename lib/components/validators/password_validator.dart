class PasswordValidator {
  static String? validate(String? password) {
    if (password == null || password.isEmpty) {
      return "Por favor, digite sua senha";
    }
    return null;
  }
}
