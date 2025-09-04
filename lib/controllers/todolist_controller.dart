import 'package:get/get.dart';
import 'package:todolist/models/todolist_model.dart';

class TodoController extends GetxController {
  var todos = <TodoItem>[].obs;

  void addTodo(String title, String description, String value) {
    final newTodo = TodoItem(
      title: title,
      description: description,
    );
    todos.add(newTodo);
  }

  void toggleTodo(int index) {
    todos[index] = TodoItem(
      title: todos[index].title,
      description: todos[index].description,
      isDone: !todos[index].isDone,
    );
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
