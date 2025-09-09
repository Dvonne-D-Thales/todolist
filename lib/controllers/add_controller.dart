import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/routes/routes.dart';

class AddController extends GetxController {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final todoController = Get.find<TodoController>();

  /// simpan kategori yang dipilih
  final RxString category = "".obs;

  void setCategory(String? value) {
    if (value != null) {
      category.value = value;
    }
  }

  void saveTask() {
    if (titleController.text.trim().isEmpty ||
        descController.text.trim().isEmpty ||
        category.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Judul, deskripsi, dan kategori harus diisi",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } else {
      todoController.addTodo(
        titleController.text.trim(),
        descController.text.trim(),
        category.value, // kirim kategori juga
      );
      Get.offAllNamed(Routes.todoList); // balik ke TodoListPage
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
