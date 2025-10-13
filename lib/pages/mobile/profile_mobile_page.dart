import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    const Color background = Color.fromARGB(255, 255, 255, 255);
    const Color primaryBlue = Color(0xFF1E3A8A); // navy elegan
    const double goldenRatio = 1.618;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            color: primaryBlue,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Profile cards dalam urutan vertikal
              Column(
                children: const [
                  ProfileCard(
                    name: "Sasi Kirana",
                    kelas: "11 PPLG 1",
                    absen: "35",
                    imageUrl:
                        "https://www.meme-arsenal.com/memes/0e2a84558b6538368956825487221f38.jpg",
                  ),
                  SizedBox(height: 24),
                  ProfileCard(
                    name: "Enriko Raina P.",
                    kelas: "11 PPLG 1",
                    absen: "12",
                    imageUrl:
                        "https://i1.sndcdn.com/artworks-kLM9u0CWqrXuM7Vo-K3CSuw-t500x500.png",
                  ),
                ],
              ),

              SizedBox(height: 40 / goldenRatio),

              // Tombol Logout
              CustomButton(
                text: "Logout",
                color: const Color.fromARGB(255, 138, 30, 30),
                textColor: Colors.white,
                onPressed: () {
                  Get.defaultDialog(
                    title: "Confirm Logout",
                    middleText: "Are you sure you want to log-out?",
                    textCancel: "Cancel",
                    textConfirm: "Logout",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      controller.logout();
                    },
                  );
                },
                borderRadius: 14,
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}