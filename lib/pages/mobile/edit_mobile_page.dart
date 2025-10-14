import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/edit_controller.dart';
import 'package:todolist/models/todolist_model.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/dropdown_buttonfield.dart';

class EditPageMobile extends StatefulWidget {
  final TodoItem todo;
  const EditPageMobile({super.key, required this.todo});

  @override
  State<EditPageMobile> createState() => _EditPageMobileState();
}

class _EditPageMobileState extends State<EditPageMobile> {
  final controller = Get.find<EditController>();

  final List<Map<String, dynamic>> categories = const [
    {"label": "School", "icon": Icons.school},
    {"label": "Business", "icon": Icons.business_center},
    {"label": "Personal", "icon": Icons.person},
  ];

  @override
  void initState() {
    super.initState();
    // 🔹 Init cuma sekali di sini, bukan di build()
    controller.initTodo(widget.todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        title: const Text("Edit Tugas"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
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

                const SizedBox(height: 20),
                const Text("Deskripsi", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                CustomTextField(
                  label: "Masukkan deskripsi",
                  controller: controller.descController,
                  maxLines: 3,
                  prefixIcon: Icons.description,
                  maxLength: 40,
                ),

                const SizedBox(height: 20),
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

                const SizedBox(height: 32),
                Center(
                  child: CustomButton(
                    text: "Update",
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: controller.saveTask,
                    borderRadius: 16,
                    elevation: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
