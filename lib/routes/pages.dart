import 'package:get/get.dart';
import 'package:todolist/bindings/addpage_binding.dart';
import 'package:todolist/bindings/mainmenupage_binding.dart';
import 'package:todolist/bindings/todolist_binding.dart';
import 'package:todolist/pages/add_page.dart';
import 'package:todolist/pages/history_page.dart';
import 'package:todolist/pages/login_page.dart';
import 'package:todolist/pages/mainmenu_page.dart';
import 'package:todolist/pages/profile_page.dart';
import 'package:todolist/pages/register_page.dart';
import 'package:todolist/pages/todolist_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/register', page: () => const RegisterPage()),
    GetPage(
      name: '/mainmenu',
      page: () => MainmenuPage(),
      binding: MainmenupageBinding(),
    ),
    GetPage(
      name: '/todolist',
      page: () => TodoListPage(),
      binding: TodolistBinding(),
    ),
    GetPage(name: '/history', page: () => const HistoryPage()),
    GetPage(name: '/profile', page: () => const ProfilePage()),
    GetPage(
      name: '/add_page',
      page: () => AddPage(),
      binding: AddBinding(),
    ), // Pastikan halaman AddTodoPage sudah dibuat
  ];
}
