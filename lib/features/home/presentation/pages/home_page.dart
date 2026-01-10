import 'package:auth_app/core/theme/app_button_styles.dart';
import 'package:auth_app/features/home/presentation/bloc/counter_bloc.dart';
import 'package:auth_app/features/home/presentation/pages/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterBloc, int>(
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/todo-list');
              },
              style: AppButtonStyles.buttonStyle,
              child: const Text('Go to Todo List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              style: AppButtonStyles.buttonStyle,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'Restart',
            child: const Icon(Icons.restart_alt),
            onPressed: () {
              counterBloc.add(CounterRestarted());
            },
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            tooltip: 'Increment',
            child: const Icon(Icons.navigate_next_rounded),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => IncDecPage()));
            },
          ),
        ],
      ),
    );
  }
}
