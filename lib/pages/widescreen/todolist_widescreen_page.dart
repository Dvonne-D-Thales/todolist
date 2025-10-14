import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/routes/routes.dart';
import 'package:todolist/widgets/todo_card.dart';


class TodolistWidescreenPage extends StatelessWidget {
  TodolistWidescreenPage({super.key});
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
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final crossAxisCount = (screenWidth ~/ 360).clamp(2, 6);

              return GridView.builder(
                itemCount: todoController.todos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                ),
                itemBuilder: (context, index) {
                  final todo = todoController.todos[index];

                  return Align(
                    alignment: Alignment.topCenter,
                    child: IntrinsicHeight(
                      child: TodoCard(
                        title: todo.title,
                        description: todo.description,
                        category: todo.category,
                        isDone: todo.isDone,
                        onDelete: () =>
                            todoController.confirmDelete(context, index),
                        onCheck: () => todoController.confirmToggle(index),

                       
                       onEdit: () {
                  Get.toNamed(Routes.edit, arguments: todo);
                },
                      ),
                    ),
                  );
                },
              );
            },
          ),
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
