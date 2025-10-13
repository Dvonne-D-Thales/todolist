import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart';
import 'package:todolist/pages/mobile/add_mobile_page.dart';
import 'package:todolist/pages/widescreen/add_widescreen_page.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  final ResponsiveController responsiveController = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 🚀 Hindari update Rx langsung di tengah build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          responsiveController.updateLayout(constraints);
        });

        return Obx(() {
          return responsiveController.isMobile.value
              ? AddPageMobile()
              : AddWidescreenPage();
        });
      },
    );
  }
}
