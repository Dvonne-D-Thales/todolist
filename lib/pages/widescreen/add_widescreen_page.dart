import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/add_controller.dart';
import 'package:todolist/widgets/costum_card.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:todolist/widgets/dropdown_buttonfield.dart';

class AddWidescreenPage extends StatelessWidget {
  AddWidescreenPage({super.key});

  final controller = Get.find<AddController>();

  // 👉 Item dropdown sekarang diatur di page
  final List<Map<String, dynamic>> categories = const [
    {"label": "School", "icon": Icons.school},
    {"label": "Business", "icon": Icons.business_center},
    {"label": "Personal", "icon": Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        title: const Text("Tambah Tugas"),
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT SIDE: FORM with 2-column layout
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: CostumCard(
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 LEFT COLUMN: Title & Description
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Name", style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 8),
                            CustomTextField(
                              label: "Enter name",
                              controller: controller.titleController,
                              maxLines: 1,
                              prefixIcon: Icons.title,
                              maxLength: 20,
                            ),

                            const SizedBox(height: 20),
                            CostumText("Description"),
                            const SizedBox(height: 8),
                            CustomTextField(
                              label: "Enter description",
                              controller: controller.descController,
                              maxLines: 3,
                              prefixIcon: Icons.description,
                              maxLength: 40,
                            ),
                            
                          ],
                        ),
                      ),

                      const SizedBox(width: 32),

                      // 🔹 RIGHT COLUMN: Category & Save Button
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Category", style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 8),
                            DropdownButtonfield(
                              value: controller.category.value.isEmpty
                                  ? null
                                  : controller.category.value,
                              items: categories,
                              onChanged: controller.setCategory,
                            ),
                            const SizedBox(height: 32),
                            CustomButton(
                              text: "Save",
                              color: const Color(0xFF1E3A8A),
                              textColor: Colors.white,
                              onPressed: () {
                                controller.saveTask(context);
                              },
                              borderRadius: 16,
                              elevation: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 24),

           
          ],
        ),
      ),
    );
  }
}