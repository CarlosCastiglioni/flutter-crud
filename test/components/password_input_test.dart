import 'package:flutter_crud/components/validators/password_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Testing password validator", () {
    var emptyName = PasswordValidator.validate("");
    expect(emptyName, "Por favor, digite sua senha");
  });
}
