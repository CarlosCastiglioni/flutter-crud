import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_page.dart';
import 'package:flutter_crud/modules/login/login_page.dart';
import 'package:flutter_crud/modules/welcome/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Crud',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/welcome",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/welcome": (context) => WelcomePage()
      },
    );
  }
}
