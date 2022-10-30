import 'dart:io';

class TodoManger {
  File storage;
  Map todos = {};

  TodoManger({required this.storage}) {
    checkExistsStorage();
    todos = getTodosFromStorage();
  }

  void checkExistsStorage() {
    if (!storage.existsSync()) storage.createSync();
  }

  Map getTodosFromStorage() {
    return {...storage.readAsLinesSync().asMap()};
  }

  String found({required int id}) {
    return todos[id];
  }

  void addTodo({required String todoText}) {
    storage.writeAsStringSync("$todoText\n", mode: FileMode.append);
  }

  void removeTodo({required int id}) {
    todos.remove(id);
    refreshStorage();
  }

  void updateTodo({required int id, required String newTitle}) {
    todos = todos.map((key, value) =>
        key == id ? MapEntry(key, newTitle) : MapEntry(key, value));
    refreshStorage();
  }

  void refreshStorage() {
    storage.writeAsStringSync(' ');
    todos.forEach((key, value) =>
        storage.writeAsStringSync("$value\n", mode: FileMode.append));
  }
}