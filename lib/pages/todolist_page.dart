import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/widgets/todo_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 240, 250),
        automaticallyImplyLeading: false,
        title: const Text('Todo List'),
      ),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(child: Text("No tasks yet"));
        }
        return ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return TodoCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isDone: todo.isDone,
              onDelete: () {
                todoController.confirmDelete(context, index);
              },
              onCheck: () {
                todoController.confirmToggle(index);
              },
            );
          },
        );
      }),
      floatingActionButton: AnimatedRotation(
        turns: turns,
        duration: const Duration(seconds: 1),
        child: FloatingActionButton(
          onPressed: () {
            // setiap ditekan, tambah 1 putaran (360 derajat)
            setState(() {
              turns += 10;
            });

            // setelah animasi jalan, pindah ke halaman add_page
            Future.delayed(const Duration(milliseconds: 500), () {
              Get.toNamed('/add_page');
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
