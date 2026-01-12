import 'package:auth_app/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/pallete.dart';
import '../../data/models/todo_model.dart';
import '../cubit/todo_cubit.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/login', (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
          backgroundColor: Pallete.gradient1,
          foregroundColor: Colors.white,
          elevation: 4,
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutRequested());
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Pallete.gradient1,
          onPressed: () {
            Navigator.of(context).pushNamed('/add-todo-page');
          },
          tooltip: "Add Todo",
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: BlocBuilder<TodoCubit, List<TodoModel>>(
                builder: (context, todos) {
                  if (authState is AuthSuccess &&
                      authState.message != null &&
                      todos.isEmpty) {
                    return Center(
                      child: Text(
                        authState.message!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                  // If there are todos, show them
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
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {
                                BlocProvider.of<TodoCubit>(
                                  context,
                                ).removeTodo(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Todo deleted")),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: Text(
                      "Add todos..",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),

            if (authState is AuthLoading)
              Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
