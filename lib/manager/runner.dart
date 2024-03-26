import 'dart:convert';
import 'package:dartssh2/dartssh2.dart';

import 'sshclientmanager.dart';

class Runner {
  final SSHClientManager sshClientManager;

  Runner(String username, String password, String host, int port)
      : sshClientManager = SSHClientManager(username, password, host, port);

  Future<void> run() async {
    try {
      final client = SSHClient(
        await SSHSocket.connect(sshClientManager.getHost(), sshClientManager.getPort()),
        username: sshClientManager.getUsername(),
        onPasswordRequest: () => sshClientManager.getPassword(),
      );

      
      // Execute command
      final session = await client.execute('ping -c 5 google.com');

      final output = <String>[];

      await for (final chunk in session.stdout.cast<List<int>>().transform(const Utf8Decoder())) {
        print('chunk: "$chunk"');
      }

      

      await session.done;

      print('Output:');
      output.forEach((line) {
        print(line);
      });

      client.close();
    } catch (e) {
      print('Error: $e');
    }
  }
}
