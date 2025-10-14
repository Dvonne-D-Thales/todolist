import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart';
import 'package:todolist/pages/mobile/add_mobile_page.dart';
import 'package:todolist/pages/widescreen/add_widescreen_page.dart';

class ResponsiveAddPage extends StatelessWidget {
  ResponsiveAddPage({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder( // ← ADA return DI SINI
      builder: (context, constraints) {
        // 🔹 Gunakan post frame biar gak ganggu build process
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.updateLayout(constraints);
        });

        return Obx(() {
          return controller.isMobile.value
              ? AddPageMobile()
              : AddWidescreenPage();
        });
      },
    );
  }
}
