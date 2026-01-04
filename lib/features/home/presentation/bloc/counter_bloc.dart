import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

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

    on<CounterRestarted>((event, emit) {
      emit(12);
    });
  }
}
