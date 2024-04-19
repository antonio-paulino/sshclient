import 'dart:convert';
import 'package:dartssh2/dartssh2.dart';

import 'sshclientmanager.dart';

class Runner {
  final SSHClientManager sshClientManager;

  Runner(String name, String username, String password, String host, int port, String command)
      : sshClientManager = SSHClientManager(name, username, password, host, port, command);

  Future<void> run() async {
    try {
      final client = SSHClient(
        await SSHSocket.connect(sshClientManager.getHost(), sshClientManager.getPort()),
        username: sshClientManager.getUsername(),
        onPasswordRequest: () => sshClientManager.getPassword(),
      );

      
      // Execute command
      final session = await client.execute(sshClientManager.getCommand());

      final output = <String>[];

      await for (final chunk in session.stdout.cast<List<int>>().transform(const Utf8Decoder())) {
        print('chunk: "$chunk"');
      }

      

      await session.done;

      print('Output:');
      for (var line in output) {
        print(line);
      }

      client.close();
    } catch (e) {
      print('Error: $e');
    }
  }
}
