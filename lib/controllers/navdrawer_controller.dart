import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/pages/history_page.dart';
import 'package:todolist/pages/profile_page.dart';
import 'package:todolist/pages/todolist_page.dart';
import '../pages/login_page.dart';

class NavDrawerController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final pages = [
    const TodoListPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  Widget get currentPages => pages[selectedIndex.value];

  void logout() {
    Get.offAll(() => const LoginPage()); // Sudah menggunakan offAll, user tidak bisa kembali ke halaman sebelumnya
  }
}
