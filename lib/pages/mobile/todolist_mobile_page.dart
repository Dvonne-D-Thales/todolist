import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/pages/edit_page.dart';
import 'package:todolist/widgets/todo_card.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});
  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF9FBFD);
    const primaryColor = Color(0xFF1E3A8A);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Tasks',
          style: TextStyle(
            color: primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(
            child: Text(
              "No tasks yet",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemCount: todoController.todos.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return IntrinsicHeight(
              // tinggi card menyesuaikan isi
              child: TodoCard(
                title: todo.title,
                description: todo.description,
                category: todo.category,
                isDone: todo.isDone,
                onDelete: () => todoController.confirmDelete(context, index),
                onCheck: () => todoController.confirmToggle(index),
                onEdit: () {
                  Get.to(
                    () => EditPage(),
                    arguments: todo,
                  )?.then((_) => todoController.loadTodos());
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: Obx(
        () => AnimatedRotation(
          turns: todoController.turns.value,
          duration: const Duration(milliseconds: 800),
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: todoController.rotateAndNavigate,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
