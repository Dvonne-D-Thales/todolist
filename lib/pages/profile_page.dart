import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            const SizedBox(height: 12),
            const Text('Nama Pengguna', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 4),
            const Text('email@contoh.com', style: TextStyle(fontSize: 14)),
            CustomButton(
              text: "Logout",
              onPressed: () {
                Get.defaultDialog(
                  title: "Confirm Logout",
                  middleText: "Are you sure you want to log out?",
                  textCancel: "Cancel",
                  textConfirm: "Logout",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    // do your logout logic here
                    Get.offAllNamed(Routes.login);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
