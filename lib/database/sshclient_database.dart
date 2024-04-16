import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:sshclient/database/sshclient_database_model.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{

  static late Isar _isar;
  // init database

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open([SSHClientModelSchema], directory:  dir.path);

  }

  // List of SSH clients
  final List<SSHClientModel> currentNotes = [];

  // Function to add a new SSH client
  Future<void> addSSHClient(SSHClientModel sshClient) async {
    final newSSHClient = SSHClientModel(
      sshClient.getName(),
      sshClient.getUsername(),
      sshClient.getPassword(),
      sshClient.getHost(),
      sshClient.getPort(),
      sshClient.getCommand(),
    );
    await _isar.writeTxn(() => _isar.sSHClientModels.put(newSSHClient));
    await fetchSSHClient();
  }

  // Function to fetch all SSH clients
  Future<void> fetchSSHClient() async {
    List<SSHClientModel> fetchNotes = await _isar.sSHClientModels.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
    notifyListeners();
  }

  // Function to update an existing SSH client
  Future<void> updateSSHClient(int id, SSHClientModel sshClient) async {
    final existingSSHClient = await _isar.sSHClientModels.get(id);
    if (existingSSHClient != null) {
      existingSSHClient.name = sshClient.name;
      existingSSHClient.username = sshClient.username;
      existingSSHClient.password = sshClient.password;
      existingSSHClient.host = sshClient.host;
      existingSSHClient.port = sshClient.port;
      existingSSHClient.command = sshClient.command;
      await _isar.writeTxn(() => _isar.sSHClientModels.put(existingSSHClient));
      await fetchSSHClient();
    }
  }


  // Function to delete an SSH client
  Future<void> deleteSSHClient(int id) async {

    await _isar.writeTxn(() => _isar.sSHClientModels.delete(id));
    await fetchSSHClient();
  }
  
}
