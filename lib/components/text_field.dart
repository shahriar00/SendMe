import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final String? hintText;
  final bool obscurText;
  TextEditingController controller;
  ChatTextField({super.key,this.hintText,required this.obscurText,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscurText,
      controller: controller,
      decoration: InputDecoration( 
        border: OutlineInputBorder( 
          borderSide: BorderSide(color:  Theme.of(context).colorScheme.tertiary,)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide( 
            color:  Theme.of(context).colorScheme.primary,
          ),
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle( 
          color:  Theme.of(context).colorScheme.primary,
        ),
        
      ),
    );
  }
}