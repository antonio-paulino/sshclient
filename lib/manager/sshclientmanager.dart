
class SSHClientManager {
  final String _name;
  final String _username;
  final String _password;
  final String _host;
  final int _port;
  final String _command;

  const SSHClientManager(String name,String username, String password, String host, int port, String command)
      : _name = name,
        _username = username,
        _password = password,
        _host = host,
        _port = port,
        _command = command;

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
  
  String getName() {
    return _name;
  }
}
