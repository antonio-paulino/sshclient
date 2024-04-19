import 'package:hive/hive.dart';
import 'package:sshclient/manager/sshclientmanager.dart';

class SSHClientDataBase{
  List sSHClientList = [];

  // reference the box
  final _sSHClientBox = Hive.box('SSHClient');


  // run this method if this is the first time ever running the app
  void createInitialData() {
    sSHClientList = [];
    updateData();
  }

  // load the data from the database
  void loadData() {
    var data = _sSHClientBox.get('SSHCLIENTLIST');
    if (data is List) {
      sSHClientList = data;
    } else {
      UnimplementedError();
    }
  }

  // update the database

  void updateData() {
    _sSHClientBox.put('SSHCLIENTLIST', sSHClientList);
  }

  // delete the database
  void deleteData() {
    _sSHClientBox.delete('SSHCLIENTLIST');
  }


}

SSHClientManager dbToClient(List dbElement) {
  return SSHClientManager(dbElement[0], dbElement[1], dbElement[2], dbElement[3], dbElement[4], dbElement[5]);
}

List clientToDb(SSHClientManager client) {
  return [client.getName(), client.getUsername(), client.getPassword(), client.getHost(), client.getPort(), client.getCommand()];
}