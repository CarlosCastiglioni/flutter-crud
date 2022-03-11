import 'package:flutter/material.dart';
import 'package:flutter_crud/modules/home/home_store.dart';
import 'package:flutter_crud/modules/welcome/welcome_page_store.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = WelcomePageStore();
  final homeController = HomeStore();

  @override
  void initState() {
    super.initState();
    homeController.getToken();
    controller.verifyToken().then((value) {
      if (value = true && homeController.unlogged != true) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
