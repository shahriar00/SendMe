import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sendme/services/auth/auth_gate.dart';
import 'package:sendme/themes/light_mode.dart';
import 'package:sendme/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAtgtrf8eXgZeyo9vTFLWlM6JecrW7UHoQ",
          appId: "1:781493622741:android:ecc2494b9e785ef8868f5c",
          messagingSenderId: "781493622741",
          projectId: "sendme-60861",
          storageBucket: "sendme-60861.appspot.com"));
  runApp(
    ChangeNotifierProvider(
      create:(context) => ThemeProvider(),
      child: const MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SendMe',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthGate(),
    );
  }
}
