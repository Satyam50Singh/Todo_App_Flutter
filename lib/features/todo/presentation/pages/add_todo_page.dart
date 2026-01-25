import 'package:auth_app/core/theme/app_button_styles.dart';
import 'package:auth_app/core/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/snackbar_utils.dart';
import '../cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _todoController = TextEditingController();
  final _dateController = TextEditingController();

  var isDueDateRequired = false;

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
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _todoController,
                  obscureText: false,
                  maxLines: null,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.edit_note),
                    border: InputBorder.none,
                    labelText: "Write your task here...",
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            InkWell(
              onTap: () {
                setState(() {
                  isDueDateRequired = !isDueDateRequired;
                  if (isDueDateRequired) {
                    _dateController.text = "";
                  }
                });
              },
              child: Row(
                children: [
                  Checkbox(
                    value: isDueDateRequired,
                    onChanged: (value) {
                      setState(() {
                        isDueDateRequired = value ?? false;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // square-ish
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Add a due date',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            if (isDueDateRequired) ...[
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: "Select Due Date",
                ),
                readOnly: true,
                onTap: () async {
                  FocusScope.of(context).unfocus();

                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(
                          useMaterial3: false,
                          colorScheme: ColorScheme.light(
                            primary: Pallete.gradient1,
                            onPrimary: Colors.white,
                            onSurface: Colors.black, // default date text
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text =
                          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                    });
                  }
                },
              ),
              SizedBox(height: 16),
            ],

            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                label: Text('Add Todo', style: TextStyle(fontSize: 16)),
                icon: Icon(Icons.add),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_todoController.text.trim().isNotEmpty) {
                    if (isDueDateRequired) {
                      if (_dateController.text.trim().isEmpty) {
                        return CustomSnackBar.showCustomSnackBar(
                          context,
                          false,
                          "Please select Due Date!",
                        );
                      }
                    }
                    todoCubit.addTodo(_todoController.text.trim());
                    CustomSnackBar.showCustomSnackBar(
                      context,
                      true,
                      "Todo added Successfully",
                    );
                    setState(() {
                      _todoController.clear();
                      isDueDateRequired = false;
                    });
                  } else {
                    CustomSnackBar.showCustomSnackBar(
                      context,
                      false,
                      "Please write something!",
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
