import 'package:flutter/material.dart';
import 'package:sendme/services/auth/auth_service.dart';
import 'package:sendme/components/custom_button.dart';
import 'package:sendme/components/text_field.dart';

class RegistrationPage extends StatelessWidget {
    final void Function()? onTap;
  RegistrationPage({super.key,this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
    TextEditingController confirm_pass = TextEditingController();

void registration(BuildContext context) async{
  final auth = AuthService();

  if (pass.text == confirm_pass.text) {
    try {
      // Show loading indicator while registering
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registering...")));
      
      // Call signUpWithEmailPassword asynchronously
      await auth.signUpWithEmailPassword(email.text, pass.text);
      
      // Registration successful, show success message or navigate to next screen
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration successful")));
    } catch (e) {
      // Registration failed, show error message
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error")));
    }
  } else {
    // Passwords don't match, show error message
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords don't match")));
  }
}

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
              color: Colors.blueGrey,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Let's create an account for you!!",
              style: TextStyle(
                  color: Colors.blueGrey, fontSize: 18),
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
              onTap: ()=> registration(context),
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
                    color: Colors.blueGrey,
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
                      color: Colors.blueGrey,
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
