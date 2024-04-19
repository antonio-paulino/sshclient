import 'package:flutter/material.dart';
import 'package:sshclient/components/drawer.dart';
import 'package:sshclient/database/sshclient_database.dart';
import 'package:sshclient/manager/runner.dart';
import 'package:sshclient/pages/client_create_page.dart';
import 'package:sshclient/manager/sshclientmanager.dart';

class SSHClient extends StatefulWidget {
  const SSHClient({super.key});

  @override
  State<SSHClient> createState() => _SSHClientState();
}

class _SSHClientState extends State<SSHClient> {
  final SSHClientDataBase _db = SSHClientDataBase();

  @override
  void initState() {
    // if this is the first time running the app, create initial data
    super.initState();
    _db.loadData();
  }

  void saveNewTask(SSHClientManager client) {
    setState(() {
      _db.sSHClientList.add(clientToDb(client));
      _db.updateData();

      Navigator.of(context).pop();
    });
  }

  void deleteTask(int id) {
    setState(() {
      _db.sSHClientList.removeAt(id);
      _db.updateData();
    });
  }

  void updateTask(SSHClientManager client, int index) {
    setState(() {
      _db.sSHClientList[index] = clientToDb(client);
      _db.updateData();
      Navigator.of(context).pop();
    });
  }

  void createClient() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClientCreatePage(
          saveNewTask: saveNewTask,
          deleteTask: deleteTask,
          updateTask: updateTask,
          isNew: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("SSH Client"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createClient();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: _db.sSHClientList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).colorScheme.primary,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_db.sSHClientList[index][0], style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(_db.sSHClientList[index][3]),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          Runner(sshClientManager: dbToClient(_db.sSHClientList[index])).run();
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientCreatePage(
                                client: dbToClient(
                                  _db.sSHClientList[index],
                                ),
                                index: index,
                                deleteTask: deleteTask,
                                saveNewTask: saveNewTask,
                                updateTask: updateTask,
                                isNew: false,
                              ),
                            ),
                          );
                        },
                        child: Text('Edit',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
