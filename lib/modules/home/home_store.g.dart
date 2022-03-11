// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$emailAtom = Atom(name: '_HomeStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_HomeStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$cpfAtom = Atom(name: '_HomeStoreBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$nameAtom = Atom(name: '_HomeStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$usersAtom = Atom(name: '_HomeStoreBase.users');

  @override
  Iterable<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(Iterable<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$unloggedAtom = Atom(name: '_HomeStoreBase.unlogged');

  @override
  bool get unlogged {
    _$unloggedAtom.reportRead();
    return super.unlogged;
  }

  @override
  set unlogged(bool value) {
    _$unloggedAtom.reportWrite(value, super.unlogged, () {
      super.unlogged = value;
    });
  }

  final _$messageAtom = Atom(name: '_HomeStoreBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$tokenAtom = Atom(name: '_HomeStoreBase.token');

  @override
  dynamic get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(dynamic value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
cpf: ${cpf},
name: ${name},
users: ${users},
unlogged: ${unlogged},
message: ${message},
token: ${token}
    ''';
  }
}
