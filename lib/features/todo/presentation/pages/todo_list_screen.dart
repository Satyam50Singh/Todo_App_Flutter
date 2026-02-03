import 'package:auth_app/core/enums/todo_action_type.dart';
import 'package:auth_app/core/routes/app_routes.dart';
import 'package:auth_app/core/utils/snackbar_utils.dart';
import 'package:auth_app/core/utils/utils.dart';
import 'package:auth_app/core/widgets/circular_loader.dart';
import 'package:auth_app/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:auth_app/features/todo/domain/entities/todo_entity.dart';
import 'package:auth_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:auth_app/features/todo/presentation/widgets/todo_list_widgets/empty_todo_state.dart';
import 'package:auth_app/features/todo/presentation/widgets/todo_list_widgets/todo_list_app_bar.dart';
import 'package:auth_app/features/todo/presentation/widgets/todo_list_widgets/todo_list_tile.dart';
import 'package:auth_app/features/todo/presentation/widgets/todo_list_widgets/todo_slidable_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/pallete.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(GetTodoListRequested());
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<LoginBloc>().state;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.loginScreen,
            (route) => false,
          );
        }

        if (state is LogoutFailure) {
          CustomSnackBar.showCustomSnackBar(
            context,
            false,
            state.errorMessage ?? 'Logout Failed!',
          );
        }
      },
      child: Scaffold(
        appBar: TodoListAppBar(
          onPressed: () {
            context.read<LoginBloc>().add(AuthLogoutRequested());
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Pallete.gradient1,
          onPressed: () {
            Navigator.pushNamed(
              context,
              RouteName.addTodoScreen,
            ).then((value) => {
              if (value == true)
                BlocProvider.of<TodoBloc>(context).add(GetTodoListRequested())
            });
          },
          tooltip: "Add Todo",
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is GetTodoListLoading) {
                    return const CircularLoader();
                  }

                  if (state is GetTodoListSuccess) {
                    if (state.todos.isNotEmpty) {
                      final todos = state.todos;

                      return Builder(
                        builder: (BuildContext parentContext) {
                          return ListView.builder(
                            itemCount: todos.length,
                            itemBuilder: (context, index) {
                              final todo = todos[index];
                              debugPrint(
                                "TodoId: ${todo.todoId} Description: ${todo.description}",
                              );

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Slidable(
                                    key: ValueKey(todo.title),
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      extentRatio: 0.20,
                                      children: [
                                        TodoSlidableAction(
                                          todoActionType: TodoActionType.delete,
                                          onPressed: (_) => deleteTodo(
                                            context,
                                            parentContext,
                                            index,
                                          ),
                                        ),
                                      ],
                                    ),
                                    startActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      extentRatio: 0.40,
                                      children: [
                                        TodoSlidableAction(
                                          todoActionType: TodoActionType.copy,
                                          onPressed: (_) => copyTodoContent(
                                            todo,
                                            parentContext,
                                          ),
                                        ),
                                        TodoSlidableAction(
                                          todoActionType: TodoActionType.share,
                                          onPressed: (_) async {
                                            await shareTodoContent(todo);
                                          },
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
                                      child: TodoListTile(todoEntity: todo),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const EmptyTodoState();
                    }
                  }

                  if (state is GetTodoListFailure) {
                    CustomSnackBar.showCustomSnackBar(
                      context,
                      false,
                      state.errorMsg ?? 'No Todos Available!',
                    );
                    return const EmptyTodoState();
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),

            if (authState is LoginLoading) const CircularLoader(),
          ],
        ),
      ),
    );
  }

  void copyTodoContent(TodoEntity todo, BuildContext parentContext) {
    Clipboard.setData(
      ClipboardData(
        text:
            '''
        📝 ${todo.title}
        \n📄 Description:
        \n${Utils.quillJsonToPlainText(todo.description)}
        \n📅 Due Date: ${todo.dueDate}
        '''
                .trim(),
      ),
    ).then(
      (_) => {
        CustomSnackBar.showCustomSnackBar(parentContext, true, 'Todo copied'),
      },
    );
  }

  Future shareTodoContent(TodoEntity todo) async {
    try {
      final result = await SharePlus.instance.share(
        ShareParams(
          text:
              '''
            📝 ${todo.title}
            \n📄 Description:
            \n${Utils.quillJsonToPlainText(todo.description)}
            \n📅 Due Date: ${todo.dueDate}
            '''
                  .trim(),
        ),
      );
      if (ShareResultStatus.success == result.status) {
        debugPrint("Todo shared");
      } else {
        debugPrint("Todo not shared");
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteTodo(BuildContext context, BuildContext parentContext, int index) {
    CustomSnackBar.showCustomSnackBar(parentContext, true, 'To be implemented');
  }
}
