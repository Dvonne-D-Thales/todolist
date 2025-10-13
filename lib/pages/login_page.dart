import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart';
import 'package:todolist/pages/mobile/login_mobile_page.dart';
import 'package:todolist/pages/widescreen/login_widescreen_page.dart';

class ResponsiveLoginPAge extends StatelessWidget {
  ResponsiveLoginPAge({super.key});
  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value
            ?  LoginPage()
            :  LoginWidescreenPage());
      },
    );
  }
}
