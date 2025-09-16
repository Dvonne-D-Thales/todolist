import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controllers/todolist_controller.dart';
import 'package:todolist/widgets/todo_card.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

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
              onDelete: () => todoController.confirmDelete(context, index),
              onCheck: () => todoController.confirmToggle(index),
            );
          },
        );
      }),
      floatingActionButton: Obx(() => AnimatedRotation(
            turns: todoController.turns.value,
            duration: const Duration(seconds: 1),
            child: FloatingActionButton(
              onPressed: todoController.rotateAndNavigate,
              child: const Icon(Icons.add),
            ),
          )),
    );
  }
}
