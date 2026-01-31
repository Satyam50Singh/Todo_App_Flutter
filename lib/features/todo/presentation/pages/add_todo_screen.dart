import 'dart:convert';

import 'package:auth_app/core/theme/pallete.dart';
import 'package:auth_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/description_card.dart';
import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/due_date_container.dart';
import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../core/utils/snackbar_utils.dart';
import '../../../../core/widgets/circular_loader.dart';
import '../widgets/add_todo_widgets/add_todo_button.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final QuillController _quillDescController = QuillController.basic();

  var isDueDateRequired = false;

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todos"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is AddTodoFailure) {
            CustomSnackBar.showCustomSnackBar(
              context,
              false,
              state.errorMsg ?? 'Todo Addition Failed!',
            );
          }

          if (state is AddTodoSuccess) {
            _titleController.clear();
            _quillDescController.clear();
            _dateController.clear();
            setState(() => isDueDateRequired = false);

            CustomSnackBar.showCustomSnackBar(
              context,
              true,
              state.message ?? 'Todo Added Successfully!',
            );
          }
        },
        builder: (context, state) {
          return SizedBox.expand(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Heading Text
                      Text(
                        'What\'s on your mind?',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),

                      Text(
                        'Add details to your task',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      TitleField(titleController: _titleController),

                      const SizedBox(height: 20),

                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      DescriptionCard(
                        quillDescController: _quillDescController,
                      ),

                      SizedBox(height: 20),

                      DueDateContainer(
                        isDueDateRequired: isDueDateRequired,
                        dateController: _dateController,
                        onInkWellTap: () {
                          setState(() {
                            isDueDateRequired = !isDueDateRequired;
                            if (isDueDateRequired) {
                              _dateController.text = "";
                            }
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            isDueDateRequired = value ?? false;
                          });
                        },
                        onCalendarTextFieldTap: () async {
                          FocusScope.of(context).unfocus();
                          await showCalendar();
                        },
                      ),

                      SizedBox(height: 30),

                      AddTodoButton(onPressed: () => addTodo(todoBloc)),
                    ],
                  ),
                ),
                if (state is AddTodoLoading) CircularLoader(),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _dateController.dispose();
    _quillDescController.dispose();
  }

  bool checkValidations() {
    if (_titleController.text.trim().isEmpty) {
      CustomSnackBar.showCustomSnackBar(context, false, "Please write title!");
      return false;
    }

    final plainText = _quillDescController.document.toPlainText().trim();

    if (plainText.isEmpty) {
      CustomSnackBar.showCustomSnackBar(
        context,
        false,
        "Please write description!",
      );
      return false;
    }

    if (isDueDateRequired && _dateController.text.trim().isEmpty) {
      CustomSnackBar.showCustomSnackBar(
        context,
        false,
        "Please select Due Date!",
      );
      return false;
    }
    return true;
  }

  Future showCalendar() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
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
  }

  void addTodo(TodoBloc todoBloc) {
    FocusScope.of(context).unfocus();

    if (!checkValidations()) {
      return;
    }

    todoBloc.add(
      AddTodoRequested(
        title: _titleController.text.trim(),
        description: jsonEncode(
          _quillDescController.document.toDelta().toJson(),
        ),
        dueDate: _dateController.text.trim(),
      ),
    );
  }
}
