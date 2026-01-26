import 'dart:convert';

import 'package:auth_app/core/routes/app_routes.dart';
import 'package:auth_app/core/utils/snackbar_utils.dart';
import 'package:auth_app/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:share_plus/share_plus.dart';

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
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.loginScreen,
            (route) => false,
          );
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
            Navigator.pushNamed(context, RouteName.addTodoScreen);
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
                  // If there are todos, show them
                  if (todos.isNotEmpty) {
                    return Builder(
                      builder: (BuildContext parentContext) {
                        return ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            final todo = todos[index];
                            debugPrint(todo.description);

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Slidable(
                                  key: ValueKey(todo.name),
                                  endActionPane: ActionPane(
                                    motion: const StretchMotion(),
                                    extentRatio: 0.40,
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          Clipboard.setData(
                                            ClipboardData(
                                              text:
                                                  '''
                                                  📝 ${todo.name}
                                                  \n📄 Description:
                                                  \n${quillJsonToPlainText(todo.description)}
                                                  \n📅 Due Date: ${todo.dueDate}
                                                  '''
                                                      .trim(),
                                            ),
                                          ).then(
                                            (_) => {
                                              CustomSnackBar.showCustomSnackBar(
                                                parentContext,
                                                true,
                                                'Todo copied',
                                              ),
                                            },
                                          );
                                        },
                                        backgroundColor: Colors.grey,
                                        foregroundColor: Colors.white,
                                        icon: Icons.copy,
                                        label: 'Copy',
                                      ),
                                      SlidableAction(
                                        onPressed: (context) {
                                          BlocProvider.of<TodoCubit>(
                                            context,
                                          ).removeTodo(index);
                                          CustomSnackBar.showCustomSnackBar(
                                            parentContext,
                                            true,
                                            'Todo deleted',
                                          );
                                        },
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                      SlidableAction(
                                        onPressed: (context) async {
                                          try {
                                            final result = await SharePlus
                                                .instance
                                                .share(
                                                  ShareParams(
                                                    text:
                                                        '''
                                                  📝 ${todo.name}
                                                  \n📄 Description:
                                                  \n${quillJsonToPlainText(todo.description)}
                                                  \n📅 Due Date: ${todo.dueDate}
                                                  '''
                                                            .trim(),
                                                  ),
                                                );
                                            if (ShareResultStatus.success ==
                                                result.status) {
                                              debugPrint("Todo shared");
                                            } else {
                                              debugPrint("Todo not shared");
                                            }
                                          } on Exception catch (e) {
                                            debugPrint(e.toString());
                                          }
                                        },
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        icon: Icons.share,
                                        label: 'Share',
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    margin: EdgeInsetsGeometry.all(1),
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                      leading: const Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.purple,
                                      ),
                                      title: Text(
                                        todo.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          QuillEditor.basic(
                                            controller: QuillController(
                                              readOnly: true,
                                              document: Document.fromDelta(
                                                Delta.fromJson(
                                                  jsonDecode(todo.description),
                                                ),
                                              ),
                                              selection:
                                                  const TextSelection.collapsed(
                                                    offset: 0,
                                                  ),
                                            ),
                                            // read: true,
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.calendar_month,
                                                size: 18,
                                                color: Colors.red,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                "Due Date: ${todo.dueDate}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit_note_outlined,
                          size: 48,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Start writing your todos",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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

  String quillJsonToPlainText(String json) {
    try {
      final delta = Delta.fromJson(jsonDecode(json));
      final document = Document.fromDelta(delta);
      return document.toPlainText().trim();
    } catch (_) {
      return "";
    }
  }
}
