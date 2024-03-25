import 'package:flutter/material.dart';
import 'package:sendme/pages/login_page.dart';
import 'package:sendme/themes/dark_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SendMe',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home:  LoginPage(),
    );
  }
}
