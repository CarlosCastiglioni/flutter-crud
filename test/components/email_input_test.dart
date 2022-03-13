import 'package:flutter_crud/components/validators/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("", () {
    var emptyEmail = EmailValidator.validate("");
    expect(emptyEmail, "Por favor, digite seu e-mail");
  });
}
