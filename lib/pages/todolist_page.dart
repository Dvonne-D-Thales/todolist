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
      appBar: AppBar(
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
              isDone: todo.isDone,
              onDelete: () {
                todoController.deleteTodo(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Deleted ${todo.title}')),
                );
              },
              onCheck: () {
                todoController.toggleTodo(index);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add_page');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
