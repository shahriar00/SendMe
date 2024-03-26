import 'package:flutter/material.dart';
import 'package:sendme/components/custom_button.dart';
import 'package:sendme/components/text_field.dart';

class RegistrationPage extends StatelessWidget {
    final void Function()? onTap;
  RegistrationPage({super.key,this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
    TextEditingController confirm_pass = TextEditingController();

  void registration() {}

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
              "Let's create an account for you!!",
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
              height: 20,
            ),
            ChatTextField(
              obscurText: true,
              hintText: "Confirm Password",
              controller: confirm_pass,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              textdata: "Register",
              onTap: registration,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login Now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
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
