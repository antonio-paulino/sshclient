import 'dart:convert';

import 'package:dartssh2/dartssh2.dart';

import 'sshclientmanager.dart';

class Runner {
  final SSHClientManager sshClientManager;

  Runner({required this.sshClientManager});

  Future<void> run() async {
    try {
      final client = SSHClient(
        await SSHSocket.connect(sshClientManager.getHost(), sshClientManager.getPort()),
        username: sshClientManager.getUsername(),
        onPasswordRequest: () => sshClientManager.getPassword(),
      );

      
      // Execute command
      final session = await client.run(sshClientManager.getCommand());
      print(utf8.decode(session));
      

      client.close();
      print("Client closed");
    } catch (e) {
      print('Error: $e');
    }
  }
}
