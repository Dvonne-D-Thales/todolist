import 'package:get/get.dart';
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
    GetPage(name: '/mainmenu', page: () => const MainmenuPage()),
    GetPage(name: '/todolist', page: () => const TodoListPage()),
    GetPage(name: '/history', page: () => const HistoryPage()),
    GetPage(name: '/profile', page: () => const ProfilePage()),
    GetPage(name: '/add_page', page: () => const AddPage()), // Pastikan halaman AddTodoPage sudah dibuat
  ];
  
}