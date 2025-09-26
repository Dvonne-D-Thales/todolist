import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/widgets/costum_text.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo atau ikon bulat
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 80,
                ),
              ),
              const SizedBox(height: 40),

              // Animasi loading
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 20),

              // Teks loading
              CostumText.heading('Loading...'),
            ],
          ),
        ),
      ),
    );
  }
}