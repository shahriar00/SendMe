import 'package:flutter/material.dart';
import 'package:sendme/services/auth/auth_service.dart';
import 'package:sendme/components/custom_button.dart';
import 'package:sendme/components/text_field.dart';

class LoginPage extends StatelessWidget {

  final void Function()? onTap;
  LoginPage({super.key,this.onTap});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void login(BuildContext context) async{
    final authService = AuthService();

    try{ 
      await authService.signInWithEmailPassword(email.text, pass.text);
    }
    catch(e){
      //throw Exception(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error")));
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
              "Welcome Back, you have been missed",
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
              height: 40,
            ),
            CustomButton(
              textdata: "Login",
              onTap: ()=>login(context),
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
                    color: Colors.blueGrey,
                    fontSize: 18
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Registered Now",
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
