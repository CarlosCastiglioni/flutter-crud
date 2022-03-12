class EmailValidator {
  static String? validate(String? email, [dynamic emailController]) {
    if (email == null || email.isEmpty) {
      return "Por favor, digite seu e-mail";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      return 'Por favor, digite um e-mail correto';
    }
    return null;
  }
}
