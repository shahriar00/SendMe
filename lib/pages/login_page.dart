import 'package:flutter/material.dart';
import 'package:sendme/components/custom_button.dart';
import 'package:sendme/components/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 100,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome Back, you have been missed",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            ChatTextField(
              obscurText: false,
              hintText: "Email",
              controller: email,
            ),
            const SizedBox(
              height: 20,
            ),
            ChatTextField(
              obscurText: true,
              hintText: "Password",
              controller: pass,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              textdata: "Login",
              onTap: login,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18
                  ),
                ),
                Text(
                  " Registered Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
