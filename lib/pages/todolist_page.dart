import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart';
import 'package:todolist/pages/mobile/todolist_mobile_page.dart';
import 'package:todolist/pages/widescreen/todolist_widescreen_page.dart';

class ResponsiveTodoListPage extends StatelessWidget {
  ResponsiveTodoListPage({super.key});
final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value
            ?  TodoListPage()
            :  TodolistWidescreenPage());
      },
    );
  }
}