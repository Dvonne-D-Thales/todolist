import 'package:flutter/material.dart';

class RegisterWidescreenPage extends StatelessWidget {
  const RegisterWidescreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
          'Register Widescreen Page',
          style: Theme.of(context).textTheme.headlineMedium,
          ),
      ),
    );
  }
}