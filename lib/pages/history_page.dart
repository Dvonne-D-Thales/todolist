import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Obx(() {
        if (historyController.history.isEmpty) {
          return const Center(child: Text("No completed tasks yet"));
        }
        return ListView.builder(
          itemCount: historyController.history.length,
          itemBuilder: (context, index) {
            final todo = historyController.history[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              trailing: const Icon(Icons.check, color: Colors.green),
            );
          },
        );
      }),
    );
  }
}
