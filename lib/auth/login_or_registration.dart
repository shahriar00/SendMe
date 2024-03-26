import 'package:flutter/material.dart';
import 'package:sendme/pages/login_page.dart';
import 'package:sendme/pages/register_page.dart';

class LoginOrRegistration extends StatefulWidget {
  const LoginOrRegistration({super.key});

  @override
  State<LoginOrRegistration> createState() => _LoginOrRegistrationState();
}

class _LoginOrRegistrationState extends State<LoginOrRegistration> {

  bool showLoginPage = true;

  void tooglePage(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: tooglePage,
      );
    }else {
      return RegistrationPage(
        onTap: tooglePage,
      );
    }
  }
}