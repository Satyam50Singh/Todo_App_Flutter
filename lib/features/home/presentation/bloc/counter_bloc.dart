import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

class CounterIncremented extends CounterEvent {}

class CounterDecremented extends CounterEvent {}

// CounterBloc is a Bloc that handles CounterEvent and emits new states.
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(12) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      if (state == 0) return;
      emit(state - 1);
    });
  }
}
