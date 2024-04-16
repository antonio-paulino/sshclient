

import 'package:flutter/material.dart';
import 'package:sshclient/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dark Mode",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
            ),
            Switch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value){
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),

          ],

        ),
      ),
    );
  }
}