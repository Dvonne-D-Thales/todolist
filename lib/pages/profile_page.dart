import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 48;
    const double nameFontSize = avatarRadius / 1.618;
    const double emailFontSize = nameFontSize / 1.618;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: avatarRadius,
              child: Icon(Icons.person, size: avatarRadius),
            ),
            const SizedBox(height: 20),
            const Text(
              'Jangkar Laut',
              style: TextStyle(fontSize: nameFontSize, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),
            const Text(
              'jangkarlaut@gmail.com',
              style: TextStyle(fontSize: emailFontSize),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: "Logout",
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                Get.defaultDialog(
                  title: "Confirm Logout",
                  middleText: "Are you sure you want to log-out?",
                  textCancel: "Cancel",
                  textConfirm: "Logout",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    Get.offAllNamed(Routes.login);
                  },
                );
              }, borderRadius: 12, elevation: 1,
            ),
          ],
        ),
      ),
    );
  }
}