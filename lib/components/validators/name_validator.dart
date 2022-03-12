class NameValidator {
  static String? validate(String? name, [int? maxLength]) {
    if (name == null || name.isEmpty) {
      return "Por favor, digite seu nome";
    }
    return null;
  }
}
