import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/responsive_controller.dart';
import 'package:todolist/pages/mobile/profile_mobile_page.dart';
import 'package:todolist/pages/widescreen/profile_widescreen_page.dart';

class ResponsiveProfilePage extends StatelessWidget {
  ResponsiveProfilePage({super.key});
  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isMobile.value
          ? ProfilePage() // hanya tampil di mobile
          : ProfileWidescreenPage(); // hanya tampil di widescreen
    });
  }
}
