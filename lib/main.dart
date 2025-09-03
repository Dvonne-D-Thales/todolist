import 'package:flutter/material.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/pages/login_page.dart';
import 'package:todolist/pages/mainmenu_page.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/pages.dart';
import 'package:todolist/routes/routes.dart';// pastikan file login_page.dart ada dan sudah diimport

void main() {
  Get.put(TodoController()); // <-- Add this line
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
       initialRoute: Routes.login  ,
      getPages: AppPages.pages,
    );
  }
}
