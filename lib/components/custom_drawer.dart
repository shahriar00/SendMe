import 'package:flutter/material.dart';
import 'package:sendme/services/auth/auth_service.dart';
import 'package:sendme/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void logOut() {
    final auth = AuthService();

    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title:const  Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading:const Icon(Icons.settings),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SettingsPage()));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logOut,
            ),
          )
        ],
      ),
    );
  }
}
