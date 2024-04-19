import 'package:flutter/material.dart';
import 'package:sshclient/manager/sshclientmanager.dart';

class ClientCreatePage extends StatefulWidget {
  final SSHClientManager client;
  final int? index;
  final Function saveNewTask;
  final Function deleteTask;
  final Function updateTask;
  final bool? isNew;

  const ClientCreatePage({super.key, this.index,this.client = const SSHClientManager('', '', '', '', 22, ''), required this.saveNewTask, required this.deleteTask, required this.updateTask, required this.isNew});

  @override
  State<ClientCreatePage> createState() => _ClientCreatePage();
}

class _ClientCreatePage extends State<ClientCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _hostController = TextEditingController();
  final TextEditingController _portController = TextEditingController(text: '22');
  final TextEditingController _commandController = TextEditingController();


    @override
  void initState() {
    super.initState();
    // Initialize text controllers with client information
    initControllers();
  }

  void initControllers(){
    _nameController.text = widget.client.getName();
    _usernameController.text = widget.client.getUsername();
    _passwordController.text = widget.client.getPassword();
    _hostController.text = widget.client.getHost();
    _portController.text = widget.client.getPort().toString();
    _commandController.text = widget.client.getCommand();

  }


  void clearText() {
    _nameController.clear();
    _usernameController.clear();
    _passwordController.clear();
    _hostController.clear();
    _portController.clear();
    _commandController.clear();
  }




  void confirmDelete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this client?"),
          actions: [
            TextButton(
              child: Text("Cancel", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:  Text("Delete", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
              onPressed: () {
                widget.deleteTask(id);
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Client'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          if (widget.index != null)
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              confirmDelete(context, widget.index!);
              clearText();
            },
          ),
          
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // If the form is valid, create a new SSHClientManager object
                SSHClientManager client = SSHClientManager(
                  _nameController.text,
                  _usernameController.text,
                  _passwordController.text,
                  _hostController.text,
                  int.parse(_portController.text),
                  _commandController.text,
                );
                // Save the new task
                if(widget.isNew!) {
                  widget.saveNewTask(client);
                } else {
                  widget.updateTask(client, widget.index!);
                }
                clearText();
              }
            },
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const Text('General'),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              const Text('Connection'),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                enableSuggestions: false,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _hostController,
                decoration: const InputDecoration(
                  labelText: 'Host',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter host';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _portController,
                decoration: const InputDecoration(
                  labelText: 'Port',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter port';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _commandController,
                decoration: const InputDecoration(
                  labelText: 'Command',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter port';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
