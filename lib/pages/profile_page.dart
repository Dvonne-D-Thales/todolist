import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/auth_controller.dart';
import 'package:todolist/widgets/custom_button.dart';
import 'package:todolist/widgets/costum_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 40;
    const double nameFontSize = avatarRadius / 1.618;
    const double emailFontSize = nameFontSize / 1.618;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: Center(
        
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Scroll horizontal untuk profile cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profil 1
                    Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: avatarRadius,
                            backgroundImage: const NetworkImage(
                              "https://www.meme-arsenal.com/memes/0e2a84558b6538368956825487221f38.jpg",
                            ),
                          ),
                          const SizedBox(height: 20),
                          CostumText("Sasi Kirana"),
                          
                          const SizedBox(height: 8),
                          CostumText("11 PPLG 1"),
                          CostumText("Absen : 35"),
                        ],
                      ),
                    ),

                    // Profil 2
                    Container(
                      width: 250,
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: avatarRadius,
                            backgroundImage: const NetworkImage(
                              "https://i1.sndcdn.com/artworks-kLM9u0CWqrXuM7Vo-K3CSuw-t500x500.png",
                            ),
                          ),
                          const SizedBox(height: 20),
                           CostumText("Enriko Raina P."),
                          const SizedBox(height: 8),
                          CostumText("11 PPLG 1"),
                          CostumText("Absen : 12"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Tombol Logout
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
                    confirmTextColor: const Color.fromARGB(255, 255, 255, 255),
                    onConfirm: () {
                      controller.logout();
                    },
                  );
                },
                borderRadius: 12,
                elevation: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
