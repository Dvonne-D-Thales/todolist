import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navdrawer_controller.dart';

class NavDrawer extends StatelessWidget {
  final NavDrawerController navC = Get.find();

  NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepPurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32),
                ),
                SizedBox(height: 12),
                Text(
                  'Joseph',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'joseph@email.com',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              navC.changeTab(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () {
              navC.changeTab(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              navC.changeTab(2);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              navC.logout();
            },
          ),
        ],
      ),
    );
  }
}
