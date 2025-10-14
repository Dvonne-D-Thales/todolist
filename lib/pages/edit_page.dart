import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart';
import 'package:todolist/pages/mobile/edit_mobile_page.dart';
import 'package:todolist/pages/widescreen/edit_widescreen_page.dart';
import 'package:todolist/models/todolist_model.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key});
  final ResponsiveController responsiveController = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    final TodoItem? todo = Get.arguments;

    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          responsiveController.updateLayout(constraints);
        });
        if (todo == null) {
          return const Scaffold(
            body: Center(
              child: Text(
                "Tidak ada data yang dikirim untuk diedit.",
                style: TextStyle(fontSize: 18, color: Colors.redAccent),
              ),
            ),
          );
        }
        return Obx(() {
          final isMobile = responsiveController.isMobile.value;
          return isMobile
              ? EditPageMobile(todo: todo)
              : EditPageWidescreen(todo: todo,);
        });
      },
    );
  }
}
