import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';

class AddController extends GetxController {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final todoController = Get.find<TodoController>();

  void saveTask() {
    if (titleController.text.trim().isEmpty ||
        descController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Judul dan deskripsi harus diisi",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } else {
      todoController.addTodo(
        titleController.text.trim(),
        descController.text.trim(),
      );
      Get.back(); // balik ke TodoListPage
      Get.snackbar(
        "Sukses",
        "Tugas berhasil ditambahkan",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
