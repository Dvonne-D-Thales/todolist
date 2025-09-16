import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';

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

  void saveTask(BuildContext context) {
    if (titleController.text.trim().isEmpty ||
        descController.text.trim().isEmpty ||
        category.value.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("warning"),
            content: const Text("Tolong isi semua field"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      todoController.addTodo(
        titleController.text.trim(),
        descController.text.trim(),
        category.value, // kirim kategori juga
      );
      Get.back(); // balik ke TodoListPage
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
