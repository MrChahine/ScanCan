import 'package:flutter/material.dart';
import 'package:scancan/Pages/Login.dart';
import 'package:scancan/Pages/Mainpage.dart';
import 'package:scancan/Pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Mainpage(),
        "/login": (context) => LoginPage(),
        "/signup": (context) => const SignupPage(),
      },
    );
  }
}
