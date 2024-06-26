# SSH Client Application

This is a Flutter application designed to create and manage SSH clients. An SSH client in this context is an object that executes commands.

## Features

- Create a new SSH client with username, password, host, port and command.
- Execute commands using the created SSH client.
- Form validation to ensure correct input.
- Scrollable form to prevent overflow when keyboard is opened.

## Dependencies
This project uses the following libraries:

- [dartssh2](https://github.com/TerminalStudio/dartssh2): An SSH and SFTP client written in pure Dart. The library provides a secure and reliable way to connect to devices over SSH, which is crucial for the functionality of this app.

- [hive](https://github.com/hivedb/hive): A lightweight key-value database written in pure Dart. Hive is used in this project for storing and retrieving user data, providing a persistent local storage solution.

## Prerequisites

- Flutter SDK

## Installation

1. Clone the repo
   ```sh
   git clone https://github.com/antonio-paulino/sshclient.git
2. Navigate to the project directory
   ```sh
   cd sshclient
3. Install dependencies
    ```sh
    flutter pub get
4. Run the app
    ```sh
    flutter run
    ```

## Contributing
Any contributions you make are **greatly appreciated**.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
