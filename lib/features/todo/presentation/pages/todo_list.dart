import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/todo_model.dart';
import '../cubit/todo_cubit.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.of(context).pushNamed('/add-todo-page');
        },
        tooltip: "Add Todo",
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: BlocBuilder<TodoCubit, List<TodoModel>>(
          builder: (context, todos) {
            if (todos.isNotEmpty) {
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.purple,
                      ),
                      title: Text(
                        todo.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        todo.createdAt,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () {
                          BlocProvider.of<TodoCubit>(context).removeTodo(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Todo deleted")),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  "Add todos..",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
