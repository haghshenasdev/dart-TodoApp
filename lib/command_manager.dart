
class CommandManager {
  Map<int, String> commands;
  CommandManager({required this.commands});

  String getHelper() {
    return """
my todo app by dart.

command help
  -h, --help    "show command list"
  -a, --add    "add to todo list"
  -l, --list    "show todo list"
  -d, --delete  "delete a todo"
  -u, --update  "update a todo"
  -f, --found   "found a todo"
""";
  }

  void printHelper() {
    print(getHelper());
  }

  checkCommandExists(int key, {required String Function() message}) {
    if (commands[key] != null) {
      return true;
    }

    print(message());
    printHelper();
    return false;
  }

  String getCommand(int key) {
    return commands[key] ?? "";
  }
}