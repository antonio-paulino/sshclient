import 'package:hive/hive.dart';
import 'package:sshclient/manager/sshclientmanager.dart';

class SSHClientDataBase{
  List<List> sSHClientList = [];

  // reference the box
  final _sSHClientBox = Hive.box('SSHClient');


  // run this method if this is the first time ever running the app
  void createInitialData() {
    sSHClientList = [
      ['name', 'username', 'password', 'host', 22, 'command'],
    ];
    updateData();
  }

  // load the data from the database
  void loadData() {
  // Retrieve data from Hive box
  var rawData = _sSHClientBox.get('SSHClient');

  if (rawData != null && rawData is List<List<dynamic>>) {
    sSHClientList = List<List>.from(rawData);
  } else {
    print('Data not in the expected format or is null');
  }
}

  // update the database

  void updateData() {
    _sSHClientBox.put('SSHClient', sSHClientList);
  }

  // delete the database
  void deleteData() {
    _sSHClientBox.delete('SSHClient');
  }


}

SSHClientManager dbToClient(List dbElement) {
  return SSHClientManager(dbElement[0], dbElement[1], dbElement[2], dbElement[3], dbElement[4], dbElement[5]);
}

List clientToDb(SSHClientManager client) {
  return [client.getName(), client.getUsername(), client.getPassword(), client.getHost(), client.getPort(), client.getCommand()];
}