import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/navdrawer_controller.dart';
import 'package:todolist/controllers/navbar_controller.dart';

class MainmenuPage extends StatelessWidget {
  const MainmenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavDrawerController navC = Get.put(NavDrawerController());
    final NavbarController navbarC = Get.put(NavbarController());

    return Scaffold(
      body: Obx(() {
        return navC.pages[navbarC.selectedIndex.value];
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
