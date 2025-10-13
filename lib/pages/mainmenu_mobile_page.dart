import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/navbar_controller.dart';

class MainmenuPage extends StatelessWidget {
  MainmenuPage({super.key});
  final navbarC = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() {
        return navbarC.mobilePages[navbarC.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navbarC.selectedIndex.value,
          onTap: (index) => navbarC.changeTab(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
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
