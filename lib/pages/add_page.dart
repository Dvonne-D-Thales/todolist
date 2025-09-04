import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/dropdown_buttonfield.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final RxString category = "".obs; // pakai GetX observable untuk kategori

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
              label: "Masukan Judul",
              controller: titleController,
            ),
            const SizedBox(height: 20),
            const Text("Deskripsi", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            CustomTextField(
              label: "Masukkan deskripsi ",
              controller: descController,
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            const Text("Kategori", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonfield(
              onChanged: (value) {
                category.value = value ?? "";
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.trim().isEmpty ||
                      descController.text.trim().isEmpty ||
                      category.value.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Judul, deskripsi, dan kategori harus diisi",
                      snackPosition: SnackPosition.BOTTOM,
                      // ignore: deprecated_member_use
                      backgroundColor: Colors.red.withOpacity(0.2),
                    );
                  } else {
                    todoController.addTodo(
                      titleController.text.trim(),
                      descController.text.trim(),
                      category.value, // kategori ikut disimpan
                    );
                    Get.back();
                    Get.snackbar(
                      "Sukses",
                      "Tugas berhasil ditambahkan",
                      snackPosition: SnackPosition.BOTTOM,
                      // ignore: deprecated_member_use
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
