import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todolist/controllers/navbar_controller.dart';

class MainmenuPage extends StatelessWidget {
  MainmenuPage({super.key});
  final navbarC = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    // final NavbarController navbarC = Get.put(NavbarController());

    return Scaffold(
      body: Obx(() {
        return navbarC.pages[navbarC.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navbarC.selectedIndex.value,
          onTap: (index) => navbarC.changeTab(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
