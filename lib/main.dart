import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sshclient/pages/client_page.dart';
import 'package:sshclient/pages/settings_page.dart';
import 'package:sshclient/theme/theme_provider.dart';

void main() async {
  // init Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


  await Hive.openBox('SSHClient');
  
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
   
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SSHClient(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/home': (context) => const SSHClient(),
        '/settings': (context) => const SettingsPage(), 
      },
    );
  }
}


