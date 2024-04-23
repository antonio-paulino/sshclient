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

      await client.authenticated;

      
      // Execute command
      final session = await client.run(sshClientManager.getCommand());
      // Print the output
      // print(utf8.decode(session));
      

      client.close();
      await client.done;
    } catch (e) {
      rethrow;
    }
  }
}
