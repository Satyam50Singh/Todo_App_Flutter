import 'dart:convert';

import 'package:auth_app/core/theme/app_button_styles.dart';
import 'package:auth_app/core/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

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
  final QuillController _quillController = QuillController.basic();

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

            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Title",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Description
            Text('Description', style: Theme.of(context).textTheme.titleMedium),

            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: QuillSimpleToolbar(
                      controller: _quillController,
                      config: const QuillSimpleToolbarConfig(
                        sectionDividerSpace: 1,
                        showFontSize: false,
                        showFontFamily: false,
                        showRedo: false,
                        showUndo: false,
                        showLineHeightButton: false,
                        showSubscript: false,
                        showSuperscript: false,
                        showDirection: false,
                        showListCheck: false,
                        showCodeBlock: false,
                        showQuote: true,
                        showIndent: false,
                        showLink: false,
                        showSearchButton: false,
                        showClearFormat: false,
                        showBackgroundColorButton: false,
                        showColorButton: false,
                        showInlineCode: false,
                        showSmallButton: false,
                        showAlignmentButtons: false,
                        showHeaderStyle: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  SizedBox(
                    height: 160,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: QuillEditor(
                        scrollController: ScrollController(),
                        controller: _quillController,
                        config: const QuillEditorConfig(
                          placeholder: "Write your todo here...",
                        ),
                        focusNode: FocusNode(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
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
                            borderRadius: BorderRadius.circular(
                              4,
                            ), // square-ish
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
                  const SizedBox(height: 20),
                  if (isDueDateRequired) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
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
                                lastDate: DateTime.now().add(
                                  const Duration(days: 365),
                                ),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData(
                                      useMaterial3: false,
                                      colorScheme: ColorScheme.light(
                                        primary: Pallete.gradient1,
                                        onPrimary: Colors.white,
                                        onSurface:
                                            Colors.black, // default date text
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
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ],
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                label: Text('Add Todo', style: TextStyle(fontSize: 16)),
                icon: Icon(Icons.add),
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  if (!checkValidations()) {
                    return;
                  }
                  todoCubit.addTodo(
                    _todoController.text.trim(),
                    jsonEncode(_quillController.document.toDelta().toJson()),
                    _dateController.text.trim(),
                  );
                  CustomSnackBar.showCustomSnackBar(
                    context,
                    true,
                    "Todo added Successfully",
                  );
                  _todoController.clear();
                  _quillController.clear();
                  _dateController.clear();
                  setState(() => isDueDateRequired = false);
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

  @override
  void dispose() {
    super.dispose();
    _todoController.dispose();
    _dateController.dispose();
    _quillController.dispose();
  }

  bool checkValidations() {
    if (_todoController.text.trim().isEmpty) {
      CustomSnackBar.showCustomSnackBar(context, false, "Please write title!");
      return false;
    }

    final descriptionJson = _quillController.document.toDelta().toJson();

    if (descriptionJson.isEmpty) {
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
}
