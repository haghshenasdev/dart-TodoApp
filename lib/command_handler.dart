import 'package:todo/command_manager.dart';
import 'package:todo/todo_manager.dart';

class CommandHandler {
  TodoManger todoManger;
  CommandManager commandManager;
  CommandHandler({required this.todoManger, required this.commandManager});

  void handler() {
    switch (commandManager.getCommand(0)) {
      case '--help':
      case '-h':
        print(commandManager.getHelper());
        break;
      case '--add':
      case '-a':
        if (!commandManager.checkCommandExists(1,
            message: () => "pleas enter todo text")) {
          break;
        }
        todoManger.addTodo(todoText: commandManager.getCommand(1));
        print('add todo successfully');
        break;

      case '--list':
      case '-l':
        print('your list todo :');
        var todos = todoManger.getTodosFromStorage();
        if (todos.isEmpty) {
          print("empty");
          break;
        }
        todos.forEach((key, value) => print("$key : $value"));
        break;

      case '--delete':
      case '-d':
        if (!commandManager.checkCommandExists(1,
            message: () => "please enter an todo id")) {
          break;
        }

        todoManger.removeTodo(id: int.parse(commandManager.getCommand(1)));

        print('deleted successfully');
        break;

      case '--update':
      case '-u':
        if (!commandManager.checkCommandExists(1,
            message: () => "please enter an todo id")) {
          break;
        }

        if (!commandManager.checkCommandExists(2,
            message: () => "please enter an todo title")) {
          break;
        }

        todoManger.updateTodo(
            id: int.parse(commandManager.getCommand(1)),
            newTitle: commandManager.getCommand(2));
        print("updated successfully");
        break;

      case '--found':
      case '-f':
        if (!commandManager.checkCommandExists(1,
            message: () => "please enter an todo id")) {
          break;
        }

        print(todoManger.found(id: int.parse(commandManager.getCommand(1))));
        break;

      default:
        commandManager.printHelper();
    }
  }
}
