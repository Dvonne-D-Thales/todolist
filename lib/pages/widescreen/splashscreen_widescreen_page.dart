import 'package:flutter/material.dart';

class SplashscreenWidescreenPage extends StatelessWidget {
  const SplashscreenWidescreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
          'Splashscreen Widescreen Page',
          style: Theme.of(context).textTheme.headlineMedium,
          ),
      ),
    );
  }
}