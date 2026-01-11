import 'package:auth_app/core/bloc/app_bloc_observer.dart';
import 'package:auth_app/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:auth_app/features/home/presentation/bloc/counter_bloc.dart';
import 'package:auth_app/features/home/presentation/cubit/counter_cubit.dart';
import 'package:auth_app/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/login/presentation/pages/login_screen.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/todo/presentation/pages/add_todo_page.dart';
import 'features/todo/presentation/pages/todo_list.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // MultiBlocProvider is used to provide multiple Blocs to the app
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const LoginScreen(),
        routes: {
          '/login': (_) => const LoginScreen(),
          '/todo-list': (_) => const TodoList(),
          '/add-todo-page': (_) => const AddTodoPage(),
        },
      ),
    );
  }
}
