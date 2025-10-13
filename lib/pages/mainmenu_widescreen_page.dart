import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/navbar_controller.dart';

class WidescreenDashboardPage extends StatelessWidget {
  WidescreenDashboardPage({super.key});

  final menuController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        // AppBar opsional, bisa kamu hapus kalau nggak mau
        appBar: AppBar(
          title: Text("", style: const TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        ),

        // Drawer untuk navigasi
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero, // ✅ remove default padding
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // ✅ prevents overflow
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/191071381?v=4',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'R&S',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '11 PPLG 1',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Todo List'),
                onTap: () {
                  menuController.changeTab(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                onTap: () {
                  menuController.changeTab(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  menuController.changeTab(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        // Body menampilkan halaman sesuai tab yang dipilih
        body:
            menuController.widescreenPages[menuController.selectedIndex.value],
      ),
    );
  }
}
