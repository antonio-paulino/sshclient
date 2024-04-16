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
          DrawerHeader(
            child: Icon(Icons.note,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          // notes option
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
