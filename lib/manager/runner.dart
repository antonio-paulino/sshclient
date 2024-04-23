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
      final session = await client.execute(sshClientManager.getCommand());


      
      await for (final chunk in session.stdout.cast<List<int>>().transform(const Utf8Decoder())) {
        print('chunk: "$chunk"');
      }
      

      

      await session.done;
      

      client.close();
      print("Client closed");
    } catch (e) {
      print('Error: $e');
    }
  }
}
