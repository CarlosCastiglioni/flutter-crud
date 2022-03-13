import 'package:flutter/material.dart';
import 'package:flutter_crud/components/validators/name_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("", () {
    var emptyName = NameValidator.validate("");
    expect(emptyName, "Por favor, digite seu nome");
  });
}
