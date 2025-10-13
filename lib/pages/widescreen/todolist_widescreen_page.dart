import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/widgets/todo_card.dart';

class TodolistWidescreenPage extends StatelessWidget {
  TodolistWidescreenPage({super.key});
  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth ~/ 380).clamp(2, 5); // slightly bigger cards

    return Scaffold(
      backgroundColor: const Color(0xFFE6F0FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F0FA),
        automaticallyImplyLeading: false,
        title: const Text(
          'Todo List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 28, // ⬆ larger title
          ),
        ),
        elevation: 0,
      ),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(
            child: Text(
              "No tasks yet",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 28,
              mainAxisSpacing: 28,
              childAspectRatio: 1.3,
            ),
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              final todo = todoController.todos[index];
              return TodoCard(
                title: todo.title,
                description: todo.description,
                category: todo.category,
                isDone: todo.isDone,
                onDelete: () => todoController.confirmDelete(context, index),
                onCheck: () => todoController.confirmToggle(index),
              );
            },
          ),
        );
      }),
      floatingActionButton: Obx(
        () => AnimatedRotation(
          turns: todoController.turns.value,
          duration: const Duration(seconds: 1),
          child: FloatingActionButton.extended(
            onPressed: todoController.rotateAndNavigate,
            icon: const Icon(Icons.add, size: 28),
            label: const Text(
              "Add Task",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
