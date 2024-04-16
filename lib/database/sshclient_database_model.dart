import 'package:isar/isar.dart';

// This annotation tells Isar to generate a type adapter for this class.
// Then run: dart run build_runner build
part 'sshclient_database_model.g.dart';

@Collection()

class SSHClientModel {
  Id id = Isar.autoIncrement;
  late final String name;
  late final String username;
  late final String password;
  late final String host;
  late final int port;
  late String command;

  SSHClientModel( this.name, this.username, this.password, this.host, this.port, this.command);

  String getUsername() {
    return username;
  }

  String getPassword() {
    return password;
  }

  String getHost() {
    return host;
  }

  int getPort() {
    return port;
  }

  String getCommand() {
    return command;
  }

  void setCommand(String command) {
    this.command = command;
  }
  String getName(){
    return name;
  }

}
