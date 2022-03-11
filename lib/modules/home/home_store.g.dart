// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
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
users: ${users},
unlogged: ${unlogged},
token: ${token}
    ''';
  }
}
