import 'package:auth_app/core/theme/app_button_styles.dart';
import 'package:auth_app/core/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todos"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'What\'s on your mind?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Write your task below',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 10),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _todoController,
                  obscureText: false,
                  maxLines: null,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.edit_note),
                    border: InputBorder.none,
                    labelText: "Write here ...",
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                label: Text('Add Todo', style: TextStyle(fontSize: 16)),
                icon: Icon(Icons.add),
                onPressed: () {
                  if (_todoController.text.trim().isNotEmpty) {
                    todoCubit.addTodo(_todoController.text.trim());
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Todo added")));
                    _todoController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please write something!")),
                    );
                  }
                },
                style: AppButtonStyles.customButtonStyle(
                  backgroundColor: Pallete.gradient1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
