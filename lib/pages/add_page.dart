import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/widgets/custom_textfield.dart';


class AddPage extends StatelessWidget {
  AddPage({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Tugas")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Judul Tugas", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Masukkan judul tugas",
              controller: titleController,
            ),
            const SizedBox(height: 20),
            const Text("Deskripsi", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Masukkan deskripsi tugas",
              controller: descController,
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.trim().isEmpty ||
                      descController.text.trim().isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Judul dan deskripsi harus diisi",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.withOpacity(0.2),
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
                      backgroundColor: Colors.green.withOpacity(0.2),
                    );
                  }
                },
                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
