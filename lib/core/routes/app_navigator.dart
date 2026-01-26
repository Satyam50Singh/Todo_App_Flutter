import 'package:auth_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/presentation/pages/login_screen.dart';
import '../../features/auth/register/presentation/pages/register_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/todo/presentation/pages/add_todo_screen.dart';
import '../../features/todo/presentation/pages/todo_list_screen.dart';

class AppNavigator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RouteName.todoListScreen:
        return MaterialPageRoute(builder: (_) => const TodoListScreen());
      case RouteName.addTodoScreen:
        return MaterialPageRoute(builder: (_) => const AddTodoScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
