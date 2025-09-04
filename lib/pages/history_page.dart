import 'package:flutter/material.dart';
import 'package:todolist/widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('History'),
      ),
      body: HistoryCard(
        title: 'judul',
        description: 'lorem ipsum dolor sit amet',
        children: List.generate(5, (index) => ListTile(
          leading: const Icon(Icons.history),
          title: Text('Riwayat ${index + 1}'),
          subtitle: const Text('Detail riwayat'),
        )),
      ),
    );
  }
}
