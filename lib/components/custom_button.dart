import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String textdata;
  CustomButton({super.key,required this.textdata, required this.onTap});

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration( 
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.all(15),
        child:  Center(child: Text(textdata,style: const  TextStyle( 
          fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
        ),),),
      ),
    );
  }
}
