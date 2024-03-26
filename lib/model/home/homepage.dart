
import 'package:flutter/material.dart';

import 'package:sshclient/model/client/addClient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable to store the button text
  String deleteButtonState = 'Delete';
  String editButtonState = 'Edit';
  String runButtonName = 'Run';

  // Variable to store the index of the selected item
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SSH'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AddClient();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (deleteButtonState == 'Deleted') {
                      deleteButtonState = 'Delete';
                    } else {
                      deleteButtonState = 'Deleted';
                    }
                  });
                },
                child: Text(deleteButtonState),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (editButtonState == 'Edited') {
                      editButtonState = 'Edit';
                    } else {
                      editButtonState = 'Edited';
                    }
                  });
                },
                child: Text(editButtonState),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (runButtonName == 'Runned') {
                      runButtonName = 'Run';
                    } else {
                      runButtonName = 'Runned';
                    }
                  });
                },
                child: Text(runButtonName),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
      ),
    );
  }

  // Function to show the add dialog
}