import 'package:auth_app/core/enums/todo_action_type.dart';
import 'package:auth_app/core/routes/app_routes.dart';
import 'package:auth_app/core/utils/snackbar_utils.dart';
import 'package:auth_app/core/utils/utils.dart';
import 'package:auth_app/core/widgets/circular_loader.dart';
import 'package:auth_app/features/auth/login/presentation/bloc/login_bloc.dart';
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
import '../../data/models/todo_model.dart';
import '../cubit/todo_cubit.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

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
                                    child: TodoListTile(todoModel: todo),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const EmptyTodoState();
                },
              ),
            ),

            if (authState is LoginLoading) CircularLoader(),
          ],
        ),
      ),
    );
  }

  void copyTodoContent(TodoModel todo, BuildContext parentContext) {
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

  Future shareTodoContent(TodoModel todo) async {
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
    BlocProvider.of<TodoCubit>(context).removeTodo(index);
    CustomSnackBar.showCustomSnackBar(parentContext, true, 'Todo deleted');
  }
}
