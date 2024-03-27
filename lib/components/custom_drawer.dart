import 'package:flutter/material.dart';
import 'package:sendme/auth/auth_service.dart';
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.home),
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
              title: Text("L O G O U T"),
              leading: Icon(Icons.home),
              onTap: logOut,
            ),
          )
        ],
      ),
    );
  }
}
