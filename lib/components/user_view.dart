import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  final String text;
  final void Function()? onTap;
  const UserTile({super.key,required this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row( 
          children: [ 
            const Icon(Icons.person),
            const SizedBox(width: 10,),
            Text(text),
          ],
        ),
      ),
    );
  }
}