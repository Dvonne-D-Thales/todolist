import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 40;
    const double nameFontSize = avatarRadius / 1.618;
    const double emailFontSize = nameFontSize / 1.618;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 240, 250),
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // vertical di tengah (jika kontennya kurang tinggi)
            crossAxisAlignment: CrossAxisAlignment.center, // horizontal center
            children: [
              // Profil 1
              Container(
                width: 250,
                padding: const EdgeInsets.symmetric(vertical: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: AssetImage("lib/assets/images/sasi.jpeg"),
                     
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Sasi Kirana',
                      style: TextStyle(
                        fontSize: nameFontSize,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '11 PPLG 1',
                      style: TextStyle(fontSize: emailFontSize),
                    ),
                    Text(
                      'Absen : 35',
                      style: TextStyle(fontSize: emailFontSize),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Profil 2
              Container(
                width: 250,
                padding: const EdgeInsets.symmetric(vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: AssetImage("lib/assets/images/enriko.jpeg"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Enriko Raina P.',
                      style: TextStyle(
                        fontSize: nameFontSize,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '11 PPLG 1',
                      style: TextStyle(fontSize: emailFontSize),
                    ),
                    Text(
                      'Absen : 12',
                      style: TextStyle(fontSize: emailFontSize),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical:20 ),
                child: CustomButton(
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
                  },
                  borderRadius: 12,
                  elevation: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
