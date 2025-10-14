import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/edit_controller.dart';
import 'package:todolist/models/todolist_model.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/dropdown_buttonfield.dart';

class EditPageWidescreen extends StatelessWidget {
  final TodoItem todo;
  EditPageWidescreen({super.key, required this.todo});

  final EditController controller = Get.find<EditController>();

  final List<Map<String, dynamic>> categories = const [
    {"label": "School", "icon": Icons.school},
    {"label": "Business", "icon": Icons.business_center},
    {"label": "Personal", "icon": Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    controller.initTodo(todo);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        title: const Text("Edit Tugas"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kolom kiri - Judul dan Deskripsi
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Judul Tugas", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      label: "Masukkan Judul",
                      controller: controller.titleController,
                      maxLines: 1,
                      prefixIcon: Icons.title,
                      maxLength: 20,
                    ),
                    const SizedBox(height: 24),
                    const Text("Deskripsi", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      label: "Masukkan deskripsi",
                      controller: controller.descController,
                      maxLines: 4,
                      prefixIcon: Icons.description,
                      maxLength: 40,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // Kolom kanan - Kategori dan tombol Update
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Kategori", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Obx(
                      () => DropdownButtonfield(
                        value: controller.category.value.isEmpty
                            ? null
                            : controller.category.value,
                        items: categories,
                        onChanged: controller.setCategory,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: CustomButton(
                        text: "Update",
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        onPressed: controller.saveTask,
                        borderRadius: 16,
                        elevation: 3,
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
