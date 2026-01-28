import 'dart:convert';

import 'package:auth_app/core/theme/pallete.dart';
import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/description_card.dart';
import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/due_date_container.dart';
import 'package:auth_app/features/todo/presentation/widgets/add_todo_widgets/title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../core/utils/snackbar_utils.dart';
import '../cubit/todo_cubit.dart';
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
    final todoCubit = BlocProvider.of<TodoCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todos"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Heading Text
            Text(
              'What\'s on your mind?',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
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

            Text('Description', style: Theme.of(context).textTheme.titleMedium),

            DescriptionCard(quillDescController: _quillDescController),

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

            AddTodoButton(onPressed: () => addTodo(todoCubit)),
          ],
        ),
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

  void addTodo(TodoCubit todoCubit) {
    FocusScope.of(context).unfocus();

    if (!checkValidations()) {
      return;
    }
    todoCubit.addTodo(
      _titleController.text.trim(),
      jsonEncode(_quillDescController.document.toDelta().toJson()),
      _dateController.text.trim(),
    );
    CustomSnackBar.showCustomSnackBar(context, true, "Todo added Successfully");
    _titleController.clear();
    _quillDescController.clear();
    _dateController.clear();
    setState(() => isDueDateRequired = false);
  }
}
