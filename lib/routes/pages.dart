import 'package:get/get.dart';
import 'package:todolist/bindings/addpage_binding.dart';
import 'package:todolist/bindings/mainmenupage_binding.dart';
import 'package:todolist/bindings/splashscreen_binding.dart';
import 'package:todolist/pages/add_page.dart';
import 'package:todolist/pages/history_page.dart';
import 'package:todolist/pages/login_page.dart';
import 'package:todolist/pages/mainmenu_page.dart';
import 'package:todolist/pages/profile_page.dart';
import 'package:todolist/pages/register_page.dart';
import 'package:todolist/pages/splashscreen_page.dart';
import 'package:todolist/pages/todolist_page.dart';
import 'package:todolist/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () =>  LoginPage()),
    GetPage(name: Routes.register, page: () =>  RegisterPage()),
    GetPage(
      name: Routes.mainmenu,
      page: () => MainmenuPage(),
      binding: MainmenupageBinding(),
    ),

    GetPage(
      name: Routes.todoList,
      page: () => TodoListPage(),
      binding: MainmenupageBinding(),
    ),

    GetPage(
      name: Routes.history,
      page: () => HistoryPage(),
      binding: MainmenupageBinding(),
    ),

    GetPage(name: Routes.history, 
    page: () => ProfilePage()
    ),
    
    GetPage(
      name: Routes.addTodo,
      page: () => AddPage(),
      binding: AddBinding(),
    ),

    GetPage(name: Routes.splashscreen, 
    page: () => SplashscreenPage(),
    binding: MainmenupageBinding(),
    ),
  ];
}
