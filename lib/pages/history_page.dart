import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/history_controller.dart';
import 'package:todolist/widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('History'),
      ),
      body: Obx(() {
        if (historyController.history.isEmpty) {
          return const Center(child: Text("No history yet"));
        }
        return ListView.builder(
          itemCount: historyController.history.length,
          itemBuilder: (context, index) {
            final item = historyController.history[index];
            return HistoryCard(
              title: item.title,
              description: item.description,
              category: item.category,
              onDelete: () {
                historyController.handleDelete(context, index);
              },
              children: const [],
            );
          },
        );
      }),
    );
  }
}
