import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty email returns error string', () {
    var result = TextFormField(
      validator: (name) {
        if (name == null || name.isEmpty) {
          return "Por favor, digite seu nome";
        } else {
          return null;
        }
      },
    );
    expect(result, "Por favor, digite seu nome");
  });
}
