import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit is a type of Bloc that doesn't have any events.
// It only emits new states.
// A class that controls UI state using functions

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(10); // Initial state is 0

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state == 0) return;
    emit(state - 1);
  }
}
