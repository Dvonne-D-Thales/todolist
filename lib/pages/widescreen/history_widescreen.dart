import 'package:flutter/material.dart';

class HistoryWidescreen extends StatelessWidget {
  const HistoryWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        body: Center(
            child: Text(
            'History Widescreen Page',
            style: Theme.of(context).textTheme.headlineMedium,
            ),
        ),
    );
  }
}