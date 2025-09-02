import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/widgets/nav_drawer.dart';
import 'package:todolist/controllers/navdrawer_controller.dart';

class MainmenuPage extends StatelessWidget {
  const MainmenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavDrawerController navC = Get.put(NavDrawerController());
    return Scaffold(
      appBar: AppBar(title: const Text('Main Menu')),
      drawer: NavDrawer(),
      body: Obx(() => navC.currentPages),
    );
  }
}