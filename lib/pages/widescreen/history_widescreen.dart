import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/history_controller.dart';
import 'package:todolist/widgets/history_card.dart';

class HistoryWidescreenPage extends StatelessWidget {
  const HistoryWidescreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        automaticallyImplyLeading: false,
        title: const Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (historyController.history.isEmpty) {
          return const Center(
            child: Text(
              "No history yet",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          );
        }

        final items = historyController.history;

        return LayoutBuilder(
          builder: (context, constraints) {
            // Tentukan jumlah kolom sesuai lebar layar
            int crossAxisCount = 1;
            if (constraints.maxWidth > 900) {
              crossAxisCount = 3;
            } else if (constraints.maxWidth > 600) {
              crossAxisCount = 2;
            }

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1400),
                    child: GridView.builder(
                      shrinkWrap: true, // biar tidak mengambil tinggi tak terbatas
                      physics:
                          const NeverScrollableScrollPhysics(), // scroll ditangani oleh SingleChildScrollView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return LayoutBuilder(
                          builder: (context, boxConstraints) {
                            return SizedBox(
                              height: boxConstraints.maxHeight,
                              child: HistoryCard(
                                title: item.title,
                                description: item.description,
                                category: item.category,
                                onDelete: () =>
                                    historyController.handleDelete(context, index),
                                children: const [],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
