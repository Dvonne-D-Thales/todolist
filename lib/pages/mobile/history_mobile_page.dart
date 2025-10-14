import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/history_controller.dart';
import 'package:todolist/widgets/history_card.dart';

class HistoryMobilePage extends StatelessWidget {
  const HistoryMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    const backgroundColor = Color(0xFFF9FBFD);
    const primaryColor = Color(0xFF1E3A8A);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(
            color: primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        if (historyController.history.isEmpty) {
          return const Center(
            child: Text(
              "No history yet",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          );
        }

        final items = historyController.history;

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = items[index];
            return HistoryCard(
              title: item.title,
              description: item.description,
              category: item.category,
              onDelete: () => historyController.handleDelete(context, index),
              children: const [],
            );
          },
        );
      }),
    );
  }
}
