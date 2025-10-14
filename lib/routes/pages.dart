import 'package:get/get.dart';
import 'package:todolist/bindings/addpage_binding.dart';
import 'package:todolist/bindings/editpage_binding.dart';
import 'package:todolist/bindings/mainmenupage_binding.dart';
import 'package:todolist/pages/add_page.dart';
import 'package:todolist/pages/edit_page.dart';
import 'package:todolist/pages/login_page.dart';
import 'package:todolist/pages/mainmenu_page.dart';
import 'package:todolist/pages/history_page.dart';
import 'package:todolist/pages/mobile/profile_mobile_page.dart';
import 'package:todolist/pages/mobile/register_mobile_page.dart';
import 'package:todolist/pages/mobile/splashscreen_mobile_page.dart'; 
import 'package:todolist/pages/todolist_page.dart';
import 'package:todolist/routes/routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: Routes.login,
     page: () =>  ResponsiveLoginPAge(),
     binding: MainmenupageBinding()),

    GetPage(name: Routes.register, page: () =>  RegisterPage()),
    GetPage(
      name: Routes.mainmenu,
      page: () => ResponsiveMainMenu(),
      binding: MainmenupageBinding(),
    ),

  
    GetPage(
      name: Routes.todoList,
      page: () => ResponsiveTodoListPage(),
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
      page: () => ResponsiveAddPage(),
      binding: MainmenupageBinding(),
    ),

    GetPage(name: Routes.splashscreen, 
    page: () => SplashscreenPage(),
    binding: MainmenupageBinding(),
    ),
    GetPage(
      name: Routes.edit,
      page: () => EditPage(),
      binding: EditBinding(),
    ),
  ];
}
