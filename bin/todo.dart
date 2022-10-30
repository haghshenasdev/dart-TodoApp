import 'dart:io';

import 'package:todo/command_handler.dart';
import 'package:todo/todo_manager.dart';
import 'package:todo/command_manager.dart';

void main(List<String> arguments) {
  TodoManger todoManger = TodoManger(storage: File('./data.txt'));
  CommandManager commandManager = CommandManager(commands: arguments.asMap());

  CommandHandler commandHandler =
      CommandHandler(todoManger: todoManger, commandManager: commandManager);
  commandHandler.handler();
}
