import 'package:get/get.dart';
import 'package:todolist/pages/history_page.dart';
import 'package:todolist/pages/profile_page.dart';
import 'package:todolist/pages/todolist_page.dart';

class NavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  
    final pages = [
    TodoListPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
