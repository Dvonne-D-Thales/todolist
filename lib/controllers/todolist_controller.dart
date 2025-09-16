import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todolist/controllers/history_controller.dart';
import 'package:todolist/models/todolist_model.dart';

class TodoController extends GetxController {
  var todos = <TodoItem>[].obs;

  void addTodo(String title, String description, String category) {
    final newTodo = TodoItem(
      title: title,
      description: description,
      category: category,
    );
    todos.add(newTodo);
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }

  void toggleTodo(int index) {
    final updatedtodo = TodoItem(
      title: todos[index].title,
      description: todos[index].description,
      category: todos[index].category,
      isDone: !todos[index].isDone,
    );

    todos[index] = updatedtodo;

    if (updatedtodo.isDone) {
      final historyController = Get.find<HistoryController>();
      historyController.addToHistory(updatedtodo);

      todos.removeAt(index);
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
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Deleted $title")),
        );
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
