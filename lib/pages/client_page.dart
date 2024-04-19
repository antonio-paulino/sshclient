import 'package:flutter/material.dart';
import 'package:sshclient/components/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sshclient/database/sshclient_database.dart';
import 'package:sshclient/pages/client_create_page.dart';
import 'package:sshclient/manager/sshclientmanager.dart';

class SSHClient extends StatefulWidget {
  const SSHClient({super.key});

  @override
  State<SSHClient> createState() => _SSHClientState();
}

class _SSHClientState extends State<SSHClient> {

  final SSHClientDataBase _db = SSHClientDataBase();

  final _sSHClientBox = Hive.box('SSHClient');

  

  @override
  void initState() {

    // if this is the first time running the app, create initial data

    
    if (_sSHClientBox.get('SSHClient') == null) {
      _db.createInitialData();
    } else {
      _db.loadData();
    }

    super.initState();
  }

  void saveNewTask(SSHClientManager client) {
    setState(() {
      _db.sSHClientList.add([client.getName(),client.getUsername(), client.getPassword(), client.getHost(), client.getPort(), client.getCommand()]);

      Navigator.of(context).pop();
    });
    
    _db.updateData();
    
    
  }
  void deleteTask(int id) {
    setState(() {
      _db.sSHClientList.removeAt(id);
    });
    _db.updateData();

  }
  void createClient() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ClientCreatePage(saveNewTask: saveNewTask, deleteTask: deleteTask,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SSH Client"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createClient,
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_db.sSHClientList[index][0]),
                  Text(_db.sSHClientList[index][1]),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClientCreatePage(client: dbToClient( _db.sSHClientList[index],), index: index, deleteTask: deleteTask, saveNewTask: saveNewTask,)));
                        },
                        child: const Text('Edit'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          // Add your delete functionality here
                        },
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
