import 'package:flutter/material.dart';
import 'package:todolist/pages/add_page.dart';
import 'package:todolist/widgets/todo_card.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return TodoCard(
            title: 'Task ${index + 1}',
            description: 'Deskripsi tugas',
            onDelete: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Hapus Task ${index + 1}')),
              );
            },
            isDone: false,
            onCheck: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddPage(),
                      ),
                    );
                  },
        child: const Icon(Icons.add),
      ),
    );
  }
}
