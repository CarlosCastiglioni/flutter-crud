class CpfValidator {
  static String? validate(String? cpf) {
    if (cpf == null || cpf.isEmpty) {
      return "Por favor, digite seu cpf";
    } else if (cpf.length < 14) {
      return "Por favor, digite um cpf válido";
    } else {
      return null;
    }
  }
}
