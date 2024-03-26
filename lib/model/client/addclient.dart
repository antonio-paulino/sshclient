import 'package:flutter/material.dart';

const double _textfieldheight = 70.0;

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddClient> {
  final TextEditingController _defaultPortController = TextEditingController(text: '22');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Client'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('General'), // Text widget to display the text 'General: '
                SizedBox(
                    height:
                        10), // Adds vertical space between the label and the TextField
              ],
            ),
            SizedBox(
              height: _textfieldheight,

              // Wrap the TextField with Expanded
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                    'Connection'), // Text widget to display the text 'Connection: '
                SizedBox(
                    height:
                        10), // Adds vertical space between the label and the TextField
              ],
            ),



            SizedBox(
              height: _textfieldheight, // Define the height for both text fields
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right:
                              8.0), // Add some spacing between the text fields
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Host',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _textfieldheight, // Set width for the port text field
                    child: TextField(
                      controller: _defaultPortController,
                      decoration: InputDecoration(
                        labelText: 'Port',
                        border: OutlineInputBorder(),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),


                ],
              ),
            ),







          ],
        ),
      ),
    );
  }
}