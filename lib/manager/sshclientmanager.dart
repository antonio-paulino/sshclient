
class SSHClientManager {
  final String _username;
  final String _password;
  final String _host;
  final int _port;
  String _command;

  SSHClientManager(String username, String password, String host, int port)
      : _username = username,
        _password = password,
        _host = host,
        _port = port,
        _command = '';

  String getUsername() {
    return _username;
  }

  String getPassword() {
    return _password;
  }

  String getHost() {
    return _host;
  }

  int getPort() {
    return _port;
  }

  String getCommand() {
    return _command;
  }

  void setCommand(String command) {
    _command = command;
  }
}
