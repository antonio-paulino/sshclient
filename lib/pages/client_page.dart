import 'package:flutter/material.dart';
import 'package:sshclient/components/drawer.dart';
import 'package:sshclient/pages/client_create_page.dart';

class SSHClient extends StatefulWidget {
  const SSHClient({super.key});

  @override
  State<SSHClient> createState() => _SSHClientState();
}

class _SSHClientState extends State<SSHClient> {
  void createClient() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ClientCreatePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: createClient,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),

    );
  }
}
