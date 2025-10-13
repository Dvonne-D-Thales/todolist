import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart';
import 'package:todolist/pages/mainmenu_widescreen_page.dart';
import 'package:todolist/pages/mainmenu_mobile_page.dart';

class ResponsiveMainMenu extends StatelessWidget {
  ResponsiveMainMenu({super.key});
  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value
            ?  MainmenuPage()
            :  WidescreenDashboardPage());
      },
    );
  }
}
