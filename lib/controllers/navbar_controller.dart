import 'package:get/get.dart';
import 'package:todolist/pages/history_page.dart';
import 'package:todolist/pages/mobile/profile_mobile_page.dart';
import 'package:todolist/pages/mobile/todolist_mobile_page.dart';
import 'package:todolist/pages/widescreen/history_widescreen.dart';
import 'package:todolist/pages/widescreen/profile_widescreen_page.dart';
import 'package:todolist/pages/widescreen/todolist_widescreen_page.dart';

class NavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  
    final widescreenPages = [
    TodolistWidescreenPage(),
    HistoryWidescreenPage(),
    ProfileWidescreenPage(),
  ];

    final mobilePages = [
    TodoListPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
