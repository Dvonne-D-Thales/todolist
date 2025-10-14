import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todolist/controllers/history_controller.dart';
import 'package:todolist/models/todolist_model.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/database/todolist_crud.dart';

class TodoController extends GetxController {
  var todos = <TodoItem>[].obs;

  // 🔹 untuk animasi FAB
  var turns = 0.0.obs;

  final TodoListDatabase _database = TodoListDatabase();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  void loadTodos() async {
    final loadedTodos = await _database.readTodos();
    todos.assignAll(loadedTodos);
  }

  void rotateAndNavigate() {
    turns.value += 10;

    Future.delayed(const Duration(milliseconds: 500), () {
      Get.toNamed(Routes.addTodo);
    });
  }

  void addTodo(String title, String description, String category) async {
    final newTodo = TodoItem(
      title: title,
      description: description,
      category: category,
    );
    await _database.createTodo(newTodo);
    loadTodos();
  }

  void deleteTodo(int index) async {
    final todo = todos[index];
    if (todo.id != null) {
      await _database.deleteTodo(
        todo.id!,
      ); // Gunakan id untuk menghapus dari database
      todos.removeAt(index);
    }
  }

  void toggleTodo(int index) async {
    final todo = todos[index];
    final updatedTodo = TodoItem(
      id: todo.id, // Pastikan id tetap sama
      title: todo.title,
      description: todo.description,
      category: todo.category,
      isDone: !todo.isDone,
    );

    if (todo.id != null) {
      await _database.updateTodo(todo.id!, updatedTodo);
      todos[index] = updatedTodo;

      if (updatedTodo.isDone) {
        final historyController = Get.find<HistoryController>();
        historyController.addToHistory(updatedTodo);
        await _database.deleteTodo(todo.id!);
        todos.removeAt(index);
      }
    }
  }

  void confirmDelete(BuildContext context, int index) {
    final title = todos[index].title;
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Apakah kamu yakin ingin menghapus '$title'?",
      textCancel: "Batal",
      textConfirm: "Hapus",
      confirmTextColor: Colors.white,
      onConfirm: () {
        deleteTodo(index);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Deleted $title")));
        Get.back();
      },
    );
  }

  void confirmToggle(int index) {
    final title = todos[index].title;
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Tandai '$title' sebagai selesai?",
      textCancel: "Batal",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () {
        toggleTodo(index);
        Get.back();
      },
    );
  }
}
