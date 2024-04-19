import 'package:flutter/material.dart';
import 'package:sshclient/components/drawer_tile.dart';
import 'package:sshclient/pages/client_page.dart';
import 'package:sshclient/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // header
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              child: Center(
                child: Text(
                  "SSH Client",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          // ssh option
          DrawerTile(
            title: "SSH",
            leading: Icon(Icons.connecting_airports,
                color: Theme.of(context).colorScheme.inversePrimary),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SSHClient(),
                ),
              );
            },
          ),
          // settings option

          DrawerTile(
            title: "Settings",
            leading: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.inversePrimary),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
