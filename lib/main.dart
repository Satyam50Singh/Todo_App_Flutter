import 'package:auth_app/core/bloc/app_bloc_observer.dart';
import 'package:auth_app/core/routes/app_navigator.dart';
import 'package:auth_app/core/routes/app_routes.dart';
import 'package:auth_app/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:auth_app/features/home/presentation/bloc/counter_bloc.dart';
import 'package:auth_app/features/home/presentation/cubit/counter_cubit.dart';
import 'package:auth_app/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await init();
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
        BlocProvider(create: (_) => sl<AuthBloc>()),
      ],
      child: MaterialApp(
        localizationsDelegates: [FlutterQuillLocalizations.delegate],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: AppNavigator.onGenerateRoute,
      ),
    );
  }
}
