import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sendme/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle( 
              fontSize: 20,fontWeight: FontWeight.bold
            ),),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.blueGrey,

        ),
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(16),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Text("Dark Mode",style: TextStyle( 
              fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold
            ),),
        
            CupertinoSwitch(value: Provider.of<ThemeProvider>(context,listen: true).isDarkMode, onChanged: (value)=>Provider.of<ThemeProvider>(context,listen: false).toggleTheme(),)
          ],
        ),
      ),
    );
  }
}